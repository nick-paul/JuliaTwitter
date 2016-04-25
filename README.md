# JuliaTwitter
*Lawrence Technological University*  

An easy way to interact with Twitter through Julia.

## Features

  - Easy streaming interface that can be used within Julia or as a separate program
  - Modular database handling: Users can allow JuliaTwitter to interact with any database with just a few lines of code (MongoDB and .txt are included as examples)
  - Functions for interacting Twitter's REST GET API

##Configuration

In order to connect with twitter, the user must have OAuth credentials. These can be set up in the `user_config.jl` file or by creating a new `TwAuth` object.

The `user_config.jl` file is also where the user must include database files. (See the database section for more details on writing database files)

## Standalone
JuliaTwitter streaming can be called from the command line for quick and easy streaming


The following will stream 500 (`-n`) tweets into the *iphone* collecion of the *tech* database in using MongoDB.
```
~/JuliaTwitter$ julia stream_tweets.jl -dbh "TwMongoDB(\"tech\", \"iphone\")" -q "iPhone" -a 100 -n 500
```

### Options

  - `-dbh` The database handler typed out as it would appear in Julia. (**required**) (see database section for more details)
  - `-q` The query to search for using [Twitter's track parameter ](https://dev.twitter.com/streaming/overview/request-parameters#track) (**required**)
  - `-n` The number of tweets to stream (*default = 100000*)
  - `-t` The length of time (in minutes) to stream tweets. If both `-n` and `-t` are used together, the program will stream until either condition is met. (*default = 60*)
  - `-a` Will print a message to the console every N tweets (*default = 20*)

## Streaming within Julia

The streaming calls within Julia work very similar to the standalone calls using keyword arguments.

The following is identical to the the call in the standalone section.

```
options = Dict()
options["track"] = "iPhone"

stream_tweets(TwMongoDB("tech", "iphone"), options; max_tweets = 500, alert_every = 100)
```

### Options

  - `db` The database handler typed out as it would appear in Julia. (**required**) (see database section for more details)
  - `options["track"]` The query to search for using [Twitter's track parameter ](https://dev.twitter.com/streaming/overview/request-parameters#track) (**required**)
  - `max_tweets` The number of tweets to stream (*default = 100000*)
  - `max_time` The length of time (in minutes) to stream tweets. If both `max_tweets` and `max_time` are used together, the program will stream until either condition is met. (*default = 60*)
  - `alert_every` Will print a message to the console every N tweets (*default = 20*)

## Custom Databases

Implementing a custom database is very easy. In order to do so, we must create a Julia type that is a subtype of `TwitterDB`. The user msu also implement two mwthods: `add_entry(Dict())` and `close_db(TwitterDB)`. Below is an example of a "database" that loads the text of a tweet to a .txt file.

Database files must be placed in the `JuliaTwitter/dbhandle` folder. They must also be included in the `user_config.jl` file. (See Configuration section)

```julia
#The TwTXTFile type writes the text of a tweet as a new line in a text file
#This type exists more for demonstration purposes and is not intended
#   to be used for large scale data mining
type TwTXTFile <: TwitterDB
  file::IOStream

  #Create a TwTXTFile object given the path of the .txt file
  function TwTXTFile(path::AbstractString)
    #a -> write, create, append
    new(open(path, "a"))
  end

end

#This function takes a dictionary (returned by the streaming API)
#   and writes it to the "database"
function add_entry(t::TwTXTFile, d::Dict{AbstractString, Any})
  #Write the text of the tweet to the file
  write(t.file, d["text"])
  write(t.file, '\n')
end

#This function is called once all of
#   the requested tweets have been written
function close_db(t::TwTXTFile)
  close(t.file)
end
```
