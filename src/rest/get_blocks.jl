function get_blocks_list(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/blocks/list.json", options))
end

function get_blocks_ids(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/blocks/ids.json", options))
end
