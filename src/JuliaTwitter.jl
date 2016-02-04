#VERSION >= v"0.4" #&& __precompile__()

module JuliaTwitter

#Must remain in this order
include("TwEntity.jl")
include("Tweet.jl")
include("TwUser.jl")

using OAuth, Requests

export
  TwAuth,
  TwUser,
  get_followers,
  auth


type TwAuth
  consumer_key::ASCIIString
  consumer_secret::ASCIIString
  access_token::ASCIIString
  access_secret::ASCIIString
end



# A few testing functions, these will be organized into files later
function get_oauth(auth::TwAuth, url::ASCIIString, options::Dict)
  oauth_request_resource(url, "GET", options, auth.consumer_key, auth.consumer_secret, auth.access_token, auth.access_secret)
end

function get_followers(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/followers/list.json", options))["users"]
end

# For testing, will be removed later
include("../../auth_setup.jl")
auth = TwAuth(consumer_key, consumer_secret, access_token, access_secret)


end