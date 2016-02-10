function get_dm_sent(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/direct_messages/sent.json", options))
end

function get_dm_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/direct_messages/show.json", options))
end

function get_dm(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/direct_messages.json", options))
end
