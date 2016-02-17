#Requires id or screen_names as an option
function get_users_lookup(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/lookup.json", options))
end

# Requires id OR screen_name
function get_users_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/show.json", options))
end

function get_users_search(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/search.json", options))
end

function get_users_profile_banner(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/profile_banner.json", options))
end

function get_users_suggestions(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/suggestions.json", options))
end

# Requires slug
function get_users_suggestions_slug(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/suggestions/:slug.json", options))
end

# Requires slug
function get_users_suggestions_slug_members(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/users/suggestions/:slug/members.json", options))
end
