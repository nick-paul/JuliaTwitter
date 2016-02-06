

function get_statuses_mentions_timeline(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/mentions_timeline.json", options))
end

function get_statuses_user_timeline(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/user_timeline.json", options))
end

function get_statuses_home_timeline(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/home_timeline.json", options))
end

function get_statuses_retweets_of_me(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://dev.twitter.com/rest/reference/get/statuses/retweets_of_me", options))
end

# Requires id
function get_statuses_retweets_id(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/retweets/$id.json", options))
end

# Requires id
function get_statuses_show_id(auth::TwAuth, options::Dict, id::Int64)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/show.json", options))
end

# Requires id
function get_statuses_oembed(auth::TwAuth, options::Dict, format="json")
  format = lowercase(format)
  if format == "json"
    return   Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/oembed.$format", options))
  elseif format == "xml"
    return get_oauth(auth, "https://api.twitter.com/1.1/statuses/oembed.$format", options)
  else
    throw(ArgumentError("Format must be either 'json' or 'xml'. User entered '$format'"))
  end
end

# Requires id
function get_statuses_retweeters_ids(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/retweeters/ids.json", options))
end

# Requires id
function get_statuses_lookup(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/statuses/lookup.json", options))
end
