type TwUser
  contributors_enabled::Bool #Account has contributor mode enabled
  created_at::AbstractString #UTC datetime of account creation
  default_profile::Bool #If true, user has not altered the theme or background of their user profile
  default_profile_image::Bool #If true, user has not uploaded their own avatar
  description::Nullable{UTF8String} #Nullable, UTF-8 string describing their account
  entities::Array{T<:TwEntity} #Entities which have been parsed out of the urlor description fields defined by the user
  favourites_count::Int #Number of tweets favorited by the user
  follow_request_sent::Nullable{Bool} #When true, the authenticating user has issued a follow request to this user account
  following::Nullable{Bool} #DEPRECEATED, When true, the authenticating user is following this user
  followers_count::Int #Number of followers this account has
  friends_count::Int #The number of users this account is following
  geo_enabled::Bool #When true, the user has enabled the possibility of geotagging their tweets
  id::Int64 #Integer representation of the unique identifier for this User
  id_str::ASCIIString #String representation of the unique identifier
  is_translator::Bool #When true, indecates that the user is a participant in Twitter's translator community
  lang::ASCIIString #The BCP 47 code for the user's ui language
  listed_count::Int #Number of public lists that this user is a member of
  location::Nullable{AbstractString} #User defined location for this account
  name::AbstractString #User defined name for the account
  notifications::Nullable{Bool} #DEPRECEATED Indecates whether the authenticated user has chosen to recieve this users tweets by SMS
  profile_background_color::ASCIIString #Hexadecimal color for the user's background
  profile_background_image_url::AbstractString #HTTP URL pointing to the background image
  profile_background_image_url_https::AbstractString #HTTPS URL pointing to the background image
  profile_background_tile::Bool #When true, indicates that the user’s profile_background_image_url should be tiled when displayed
  profile_banner_url::AbstractString #HTTPS URL pointing to the standard web representation of the user's profile banner
  profile_image_url::AbstractString #A HTTP URL pointing to the user’s avatar image
  profile_image_url_https::AbstractString #A HTTPS URL pointing to the user’s avatar image
  profile_link_color::ASCIIString #The hexadecimal color the user has chosen to display links with in their Twitter UI
  profile_sidebar_border_color::ASCIIString #The hexadecimal color the user has chosen to display sidebar borders with in their Twitter UI
  profile_sidebar_fill_color::ASCIIString #The hexadecimal color the user has chosen to display sidebar backgrounds with in their Twitter UI
  profile_text_color::ASCIIString #The hexadecimal color the user has chosen to display text with in their Twitter UI
  profile_use_background_image::Bool #When true, indicates the user wants their uploaded background image to be used
  protected::Bool #When true, indicates that this user has chosen to protect their Tweets
  screen_name::AbstractString #The screen name, handle, or alias that this user identifies themselves with
  show_all_inline_media::Bool #Indicates that the user would like to see media inline
  status::Nullable{Tweet} #Nullable. If possible, the user’s most recent tweet or retweet
  statuses_count::Int #The number of tweets (including retweets) issued by the user
  time_zone::Nullable{ASCIIString} #Nullable. A string describing the Time Zone this user declares themselves within
  url::Nullable{AbstractString} #Nullable. A URL provided by the user in association with their profile
  utc_offset::Nullable{Int} #Nullable. The offset from GMT/UTC in seconds
  verified::Bool #When true, indicates that the user has a verified account
  withheld_in_countries::ASCIIString #When present, indicates a textual representation of the two-letter country codes this user is withheld from
  withheld_scope::ASCIIString #When present, indicates whether the content being withheld is the “status” or a “user.”
end
