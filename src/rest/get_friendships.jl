function get_friendships_no_retweets_ids(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/friendships/no_retweets/ids.json", options))
end

function get_friendships_incoming(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/friendships/incoming.json", options))
end

function get_friendships_outgoing(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/friendships/outgoing.json", options))
end

function get_friendships_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/friendships/show.json", options))
end

function get_friendships_lookup(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/friendships/lookup.json", options))
end
