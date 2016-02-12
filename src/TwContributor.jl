type TwContributor
  id::Int64 #ID of user who contributed to this Tweet
  id_str::AbstractString #String representation of ID
  screen_name::AbstractString #Screen Name

  TwContributor(d::Dict{AbstractString, Any}) = new(
    get(d, "id", 0),
    get(d, "id_str", "0"),
    get(d, "screen_name", "")
  )
end
