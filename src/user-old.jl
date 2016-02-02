type TwUser
  contributors_enabled::Bool
  created_at::AbstractString
  default_profile::Bool
  default_profile_image::Bool
  description::AbstractString
  entities::Dict{AbstractString,Any}
  favourites_count::Int
  follow_request_sent::Bool
  followers_count::Int
  following::Bool
  friends_count::Int
  geo_enabled::Bool
  has_extended_profile::Bool
  id::Int
  id_str::AbstractString
  is_translation_enabled::Bool
  is_translator::Bool
  lang::AbstractString
  listed_count::Int
  location::AbstractString
  muting::Bool
  name::AbstractString
  notifications::Bool
  profile_background_color::UInt32
  profile_background_image_url::AbstractString
  profile_background_image_url_https::AbstractString
  profile_background_tile::Bool
  profile_banner_url::AbstractString
  profile_image_url::AbstractString
  profile_image_url_https::AbstractString
  profile_link_color::UInt32
  profile_sidebar_border_color::UInt32
  profile_sidebar_fill_color::UInt32
  profile_text_color::UInt32
  profile_use_background_image::Bool
  protected::Bool
  screen_name::AbstractString
  status::Dict{AbstractString,Any}
  statuses_count::Int
  time_zone::AbstractString
  url::AbstractString
  utc_offset::Int
  verified::Bool



  function TwUser(d::Dict{AbstractString, Any})
    new(
      ...
      )
  end

end
