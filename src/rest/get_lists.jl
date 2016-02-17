function get_lists_list(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/list.json", options))
end

#Requires list_id and slug
function get_lists_statuses(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/statuses.json", options))
end

function get_lists_memberships(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/memberships.json", options))
end

#Requires list_id and slug
function get_lists_subscribers(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/subscribers.json", options))
end

#Requires list_id and slug
function get_lists_subscribers_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/subscribers/show.json", options))
end

#Requires list_id and slug
function get_lists_members_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/members/show.json", options))
end

#Requires list_id and slug
function get_lists_members(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/members.json", options))
end

#Requires list_id and slug
function get_lists_show(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/show.json", options))
end

function get_lists_subscriptions(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/subscriptions.json", options))
end

function get_lists_ownerships(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/lists/ownerships.json", options))
end
