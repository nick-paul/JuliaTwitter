#VERSION >= v"0.4" #&& __precompile__()

module JuliaTwitter

#Must remain in this order
include("types/TwContributor.jl")
include("types/TwCoordinate.jl")
include("types/TwEntity.jl")
include("types/TwUser.jl")
include("types/Tweet.jl")


using OAuth, Requests, Compat

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

#Include REST APIs
include("rest/get_account.jl")
include("rest/get_application.jl")
include("rest/get_blocks.jl")
include("rest/get_direct_messages.jl")
include("rest/get_favorites.jl")
include("rest/get_followers.jl")
include("rest/get_friends.jl")
include("rest/get_friendships.jl")
include("rest/get_geo.jl")
include("rest/get_help.jl")
include("rest/get_lists.jl")
include("rest/get_mutes.jl")
include("rest/get_saved_searches.jl")
include("rest/get_search.jl")
include("rest/get_statuses.jl")
include("rest/get_trends.jl")
include("rest/get_users.jl")

#Export REST APIs
export
  get_account_settings,
  get_account_verify_credentials,
  get_application_rate_limit_status,
  get_blocks_ids,
  get_blocks_list,
  get_dm,
  get_dm_sent,
  get_dm_show,
  get_favorites_list,
  get_followers_ids,
  get_followers_list,
  get_friends_ids,
  get_friends_list,
  get_friendships_incoming,
  get_friendships_lookup,
  get_friendships_no_retweets_ids,
  get_friendships_outgoing,
  get_friendships_show,
  get_geo_id_place_id,
  get_geo_reverse_geocode,
  get_geo_search,
  get_help_configuration,
  get_help_languages,
  get_help_privacy,
  get_help_tos,
  get_lists_list,
  get_lists_members,
  get_lists_members_show,
  get_lists_memberships,
  get_lists_ownerships,
  get_lists_show,
  get_lists_statuses,
  get_lists_subscribers,
  get_lists_subscribers_show,
  get_lists_subscriptions,
  get_mutes_users_ids,
  get_mutes_users_list,
  get_saved_searches,
  get_saved_searches_show_id,
  get_search,
  get_searchq,
  get_statuses,
  get_statuses_home_timeline,
  get_statuses_lookup,
  get_statuses_mentions_timeline,
  get_statuses_oembed,
  get_statuses_retweets_id,
  get_statuses_retweets_of_me,
  get_statuses_retweeters_ids,
  get_statuses_show_id,
  get_statuses_user_timeline,
  get_trends_available,
  get_trends_closest,
  get_trends_place,
  get_users,
  get_users_lookup,
  get_users_profile_banner,
  get_users_search,
  get_users_show,
  get_users_suggestions,
  get_users_suggestions_slug,
  get_users_suggestions_slug_members



#Streaming
include("streaming/streaming.jl")

#Include all active dbhandles
#include("../dbhandle/active.jl")

#Include User Config File
include("../user_config.jl")

auth = TwAuth(USER_AUTH_DICT[:consumer_key],
              USER_AUTH_DICT[:consumer_secret],
              USER_AUTH_DICT[:access_token],
              USER_AUTH_DICT[:access_secret])

export TwitterDB, stream_tweets

end
