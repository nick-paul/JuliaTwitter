# Requires id OR screen_name
function get_users_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/show.json", options))
end
