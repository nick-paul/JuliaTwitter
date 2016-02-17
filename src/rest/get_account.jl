function get_account_settings(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/account/settings.json", options))
end

function get_account_verify_credentials(auth::TwAuth, options::Dict)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/account/verify_credentials.json", options))
end
