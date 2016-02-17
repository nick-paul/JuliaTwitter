type TwCoordinate
  lon::Float32
  lat::Float32
end

function TwCoordinate(d::Dict)
  TwCoordinate(
    get(d, "coordinates", [0])[1],
    get(d, "coordinates", [0,0])[2]
  )
end
