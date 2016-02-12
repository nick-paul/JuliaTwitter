#VERSION >= v"0.4" #&& __precompile__()

module JuliaTwitter

#Must remain in this order
include("TwContributor.jl")
include("TwCoordinate.jl")
include("TwEntity.jl")
include("TwUser.jl")
include("Tweet.jl")


using OAuth, Requests

export
  TwAuth,
  TwUser,
  Tweet,
  TwCoordinate,
  TwContributor,
  auth,
  get_oauth


type TwAuth
  consumer_key::ASCIIString
  consumer_secret::ASCIIString
  access_token::ASCIIString
  access_secret::ASCIIString
end

# A few testing functions, these will be organized into files later
function get_oauth(auth::TwAuth, url::ASCIIString, options::Dict)
  oauth_request_resource(url, "GET", options, auth.consumer_key, auth.consumer_secret, auth.access_token, auth.access_secret)
end

include("get_application.jl")
include("get_direct_messages.jl")
include("get_help.jl")
include("get_statuses.jl")
include("get_users.jl")

export
  get_application_rate_limit_status,
  get_dm,
  get_dm_sent,
  get_dm_show,
  get_help_configuration,
  get_help_languages,
  get_help_privacy,
  get_help_tos,
  get_statuses,
  get_statuses_lookup,
  get_statuses_oembed,
  get_statuses_show_id,
  get_statuses_retweets_id,
  get_statuses_home_timeline,
  get_statuses_user_timeline,
  get_statuses_retweeters_ids,
  get_statuses_retweets_of_me,
  get_statuses_mentions_timeline,
  get_users,
  get_users_show,
  get_users_search,
  get_users_lookup,
  get_users_suggestions,
  get_users_profile_banner,
  get_users_lookup,
  get_users_suggestions_slug,
  get_users_suggestions_slug_members


end
