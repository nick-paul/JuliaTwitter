#Returns a collection of relevant Tweets matching a specified query. Requires option q
function get_search(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/search/tweets.json", options))
end
