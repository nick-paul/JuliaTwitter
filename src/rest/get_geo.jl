#Requires place_id
function get_geo_id_place_id(auth::TwAuth, options::Dict)
  place_id = options["place_id"]
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/geo/id/$place_id.json", options))
end

#Requires lat, long
function get_geo_reverse_geocode(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/geo/reverse_geocode.json", options))
end

function get_geo_search(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/geo/search.json", options))
end
