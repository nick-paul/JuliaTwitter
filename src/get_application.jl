
function get_application_rate_limit_status(auth::TwAuth)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/application/rate_limit_status.json", Dict()))
end
