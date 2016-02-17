function get_saved_searches(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/saved_searches/list.json", options))
end

function get_saved_searches_show_id(auth::TwAuth, options::Dict)
  id = options["id"]
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/saved_searches/show/$id.json", options))
end
