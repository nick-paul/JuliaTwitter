function get_mutes_users_ids(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/mutes/users/ids.json", options))
end

function get_mutes_users_list(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/mutes/users/list.json", options))
end
