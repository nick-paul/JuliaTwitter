using JSON

#Twitter Database Type
abstract TwitterDB

#Twitter Stream Object
include("TwStream.jl")


function stream_tweets(auth::TwAuth, db::TwitterDB, api_options::Dict;
                      max_tweets::Int = 10,
                      max_time::Int = 60,
                      alert_every::Int = 100,
                      max_err_attemps::Int = 3)

  twstrm = TwStream(auth, api_options)
  streamdb(twstrm, db, max_tweets = max_tweets,
                       max_time = max_time,
                       alert_every = alert_every,
                       max_err_attemps = max_err_attemps)
end

#Use default auth
function stream_tweets(db::TwitterDB, api_options::Dict;
                      max_tweets::Int = 10,
                      max_time::Int = 60,
                      alert_every::Int = 100,
                      max_err_attemps::Int = 3)

  twstrm = TwStream(JuliaTwitter.auth, api_options)
  streamdb(twstrm, db, max_tweets = max_tweets,
                       max_time = max_time,
                       alert_every = alert_every,
                       max_err_attemps = max_err_attemps)
end


#Move tweets from the stream into the database
function streamdb(tw_stream::TwStream, db::TwitterDB;
                  max_tweets::Int = 10,
                  max_time::Int = 60,
                  alert_every::Int = 100,
                  max_err_attemps::Int = 3)

  #Create a stream buffer
  buf = start(eachline(tw_stream.twstream))
  tweet_count = 0
  err_attempts = 0

  #Calculate the ending time (convert  mins to secs to ms)
  end_time = time() +  60 * max_time

  while tweet_count < max_tweets
    #Exit the loop if we have passed the time limit
    if time() > end_time
      println("Time limit reached. Collected $tweet_count tweets")
      break
    end

    #Capture the next line and save the buf state
    line,buf = next(eachline(tw_stream.twstream), buf)

    try
      #Parse JSON
      dict = JSON.parse(line)
      add_entry(db, dict)
      tweet_count+=1

      #reset err_attempts counter
      err_attempts = 0
    catch stream_error
      #Twitter will return an empty line if there hasn't been a tweet in awhile
      #     that should not count as an error

      #If the line is not empty, alert the user
      if length(line) > 1
        err_attempts+=1

        println("[WARNING] Error processing entry: $line")
        println("          Continuing execution...")

        #Check err attempts
        if err_attempts >= max_err_attemps
          println("[ERROR] Maximum number of consecutive errors reached. Exiting...")

          #Try closing the database
          try
            close_db(db)
          catch
          end

          return false
        end

      end
    end

    #Update user
    if tweet_count % alert_every == 0 && tweet_count != 0
      println(STDOUT, "Wrote tweet $tweet_count...")
    end
  end

  close_db(db)

  true
end
