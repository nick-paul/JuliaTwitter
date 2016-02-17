function get_help_configuration(auth::TwAuth)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/help/configuration.json", Dict()))
end

function get_help_languages(auth::TwAuth)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/help/languages.json", Dict()))
end

function get_help_privacy(auth::TwAuth)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/help/privacy.json", Dict()))
end

function get_help_tos(auth::TwAuth)
  Requests.json(get_oauth(auth, "https://api.twitter.com/1.1/help/tos.json", Dict()))
end
