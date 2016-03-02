using Requests, OAuth, Compat, Mongo, JSON


s_options = Dict()
#s_endpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
s_endpoint = "https://stream.twitter.com/1.1/statuses/sample.json"

#Build query string
s_query_str = Requests.format_query_str(s_options)

#Build oauth_header
s_oauth_header_val = oauth_header("GET", s_endpoint, s_options, auth.consumer_key, auth.consumer_secret, auth.access_token, auth.access_secret)

#Make request
s_headers = @compat(
   Dict{AbstractString,AbstractString}(
       "Content-Type" => "application/x-www-form-urlencoded",
       "Authorization" => s_oauth_header_val,
       "Accept" => "*/*"
   )
)

@everywhere s_out = Requests.get_streaming(URI("$(s_endpoint)?$s_query_str"); headers = s_headers)


mongo_client = MongoClient()
@everywhere mongo_col = MongoCollection(mongo_client, "test", "tweets")
println("Mongo Client Initailized")


# Spawn a thread for writing tweets to a file
# @async begin
#   println("began async")
#   for line in eachline(s_out)
#     dict = JSON.parse(line)
#     println("\tAbout to insert line...")
#     insert(mongo_col, dict)
#     println(STDOUT, "\tWrote a line to the mongo client")
#   end
# end

# open("stream.txt", "w") do file
#   chunk_count  = 0
#   max_chunks = 1
#   while !eof(s_out)
#     if chunk_count >  max_chunks
#       break
#     end
#     println("Recieving Chunk #$chunk_count")
#     #write(file, readavailable(s_out))
#     chunk_count += 1
#   end
# end

@everywhere function get_lines(count, name)
  buf = start(eachline(s_out))
  line_count = 0

  while line_count < count
    line,buf = next(eachline(s_out), buf)
    dict = JSON.parse(line)
    insert(mongo_col, dict)
    #println(STDOUT, "Proc $name: Wrote line $line_count of $count...")
    line_count+=1
  end
  true
end

get_lines(8000, "A")


println("done.")

# using Requests, OAuth, Compat
#
# s_api_url = "https://stream.twitter.com/1.1/statuses/filter.json"
#
# s_options = Dict()
#
# s_query_str = Requests.format_query_str(s_options)
#
# s_oauth_header_val = oauth_header("POST", "https://stream.twitter.com/1.1/statuses/filter.json
# ", s_options, auth.consumer_key, auth.consumer_secret, auth.access_token, auth.access_secret)
#
# s_the_headers = @compat(
#     Dict{AbstractString,AbstractString}(
#         "Content-Type" => "application/x-www-form-urlencoded",
#         "Authorization" => s_oauth_header_val,
#         "Accept" => "*/*"
#         #"Transfer-Encoding"=>"chunked"
#     )
# )
#
# s_stream = Requests.get_streaming(s_api_url, headers=s_the_headers, write_body=false)
#
#
# function stream_track(auth::TwAuth, options::Dict)
#   api_url = "https://stream.twitter.com/1.1/statuses/filter.json"
#
#   #Build query string
#   query_str = Requests.format_query_str(options)
#
#   #Build oauth_header
#   oauth_header_val = oauth_header("POST", "https://stream.twitter.com/1.1/statuses/filter.json
# ", options, auth.consumer_key, auth.consumer_secret, auth.access_token, auth.access_secret)
#
#   #Build complete header
#   the_headers = @compat(
#       Dict{AbstractString,AbstractString}(
#           "Content-Type" => "application/x-www-form-urlencoded",
#           "Authorization" => oauth_header_val,
#           "Accept" => "*/*"
#           #"Transfer-Encoding"=>"chunked"
#       )
#   )
#
#   stream = Requests.post_streaming(api_url, headers=the_headers, write_body=false)
#   #stream = Requests.post_streaming(api_url, headers=headers, write_body=false)
#
#   # `write_body=false` causes `post_streaming` to only write the headers, allowing you the chance to write the body manually
#O #  for data_chunk in ["first", "second"]
# #      write_chunked(stream, data_chunk)
# #  end
# #  write_chunked(stream, "")  # Signal that the body is complete
#
# #  response = readall(stream)  # Get back the server's response
#
# #  response
# end
