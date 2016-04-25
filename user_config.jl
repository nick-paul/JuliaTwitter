#User OAuth data goes here
USER_AUTH_DICT = Dict(
  :consumer_key => "XXXXXXXXX",
  :consumer_secret => "XXXXXXXXX",
  :access_token => "XXXXXXXXX",
  :access_secret => "XXXXXXXXX"
)


#DBHandles
#Comment out to de-activate

include("dbhandle/TwTXTFile.jl")
#include("dbhandle/TwMongoDB.jl")
