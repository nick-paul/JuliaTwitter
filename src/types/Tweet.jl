# Type file for a Tweet
# Placeholder for now


type Tweet
  #annotations #unused
  #contributors::Nullable{Array{TwContributor}}
  #coordinates::Nullable{TwCoordinate}
  created_at::AbstractString
  current_user_retweet::Dict{AbstractString, Any}
  #entities::Array{TwEntities}
  favorite_count::Nullable{Int}
  favorited::Bool
  filter_level::AbstractString
  #geo # DEPRECEATED
  id::Int64
  id_str::AbstractString
  in_reply_to_screen_name::Nullable{AbstractString}
  in_reply_to_status_id::Nullable{Int64}
  in_reply_to_status_id_str::Nullable{AbstractString}
  in_reply_to_user_id::Nullable{Int64}
  in_reply_to_user_id_str::Nullable{AbstractString}
  lang::AbstractString
  #place::Nullable{TwPlace}
  possibly_sensitive::Nullable{Bool}
  quoted_status_id::Int64
  quoted_status_id_str::AbstractString
  quoted_status::Dict{AbstractString, Any} #Tweet
  #scopes::Dict
  retweet_count::Int
  retweeted::Bool
  retweeted_status::Dict{AbstractString, Any} #Tweet
  source::AbstractString
  text::AbstractString
  truncated::Bool
  user::Dict{AbstractString, Any} #User
  withheld_copyright::Bool
  withheld_in_countries::Array{AbstractString}
  withheld_scope::AbstractString

  Tweet(d::Dict{AbstractString, Any}) = new(
    # annotations #unused
    #get(d,"contributors", Nullable{Array{TwContributor}}()),
    #get(d,"coordinates", Nullable{TwCoordinate}()),
    get(d,"created_at", ""),
    get(d,"current_user_retweet", Dict{AbstractString, Any}()),
    # get(d,"entities", Array{TwEntities}()),
    get(d,"favorite_count", Nullable{Int}()),
    get(d,"favorited", false),
    get(d,"filter_level", ""),
    # get(d,"geo", # DEPRECEATED
    get(d,"id", 0),
    get(d,"id_str", ""),
    get(d,"in_reply_to_screen_name", Nullable{AbstractString}()),
    get(d,"in_reply_to_status_id", Nullable{Int64}()),
    get(d,"in_reply_to_status_id_str", Nullable{AbstractString}()),
    get(d,"in_reply_to_user_id", Nullable{Int64}()),
    get(d,"in_reply_to_user_id_str", Nullable{AbstractString}()),
    get(d,"lang", ""),
    #get(d,"place", Nullable{TwPlace}()),
    get(d,"possibly_sensitive", Nullable{Bool}()),
    get(d,"quoted_status_id", 0),
    get(d,"quoted_status_id_str", ""),
    get(d,"quoted_status",Dict{AbstractString, Any}()),
    #get(d,"scopes", Dict()),
    get(d,"retweet_count", 0),
    get(d,"retweeted", false),
    get(d,"retweeted_status",Dict{AbstractString, Any}()),
    get(d,"source", ""),
    get(d,"text", ""),
    get(d,"truncated", false),
    get(d,"user",Dict{AbstractString, Any}()),
    get(d,"withheld_copyright", false),
    get(d,"withheld_in_countries", Array{AbstractString}()),
    get(d,"withheld_scope","")
  )
end


# Type file for a twitter user

function parse_user(str::AbstractString)
  "parse successful"
end
