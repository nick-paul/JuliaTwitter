#Returns a collection of relevant Tweets matching a specified query. Requires option q
function get_search(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/search/tweets.json", options))
end


function get_searchq(auth::TwAuth,
                      query::ASCIIString;
                      qtype = "popular",
                      count = "100",
                      include_entities = "false"
                      )
                      
  get_search(auth, Dict("q" => query,
                        "type" => qtype,
                        "count" => count,
                        "include_entities" => include_entities
                        ))
end
