using Requests, OAuth, Compat

type TwStream
  twstream::Requests.ResponseStream

  function TwStream(auth::TwAuth, options::Dict)
    new(init_stream(auth, "POST", "https://stream.twitter.com/1.1/statuses/filter.json", options))
  end

  TwStream(options::Dict) = TwStream(JuliaTwitter.auth, options)
end


#Initialize a Requests.ResponseStream
#Getting 401 errors? make sure to use post_streaming (typ = "POST")
function init_stream(auth::TwAuth, typ::ASCIIString, endpoint::AbstractString, options::Dict)
  #Validate typ
  typ = uppercase(typ)
  if typ != "POST" && typ != "GET"
    throw(ArgumentError("$typ is an invalid type. Use GET or POST"))
  end

  #Build query string
  query_str = Requests.format_query_str(options)

  #Build oauth_header
  oauth_header_val = oauth_header(typ, endpoint, options, auth.consumer_key, auth.consumer_secret, auth.access_token, auth.access_secret)

  #Make request
  headers = @compat(
     Dict{AbstractString,AbstractString}(
         "Content-Type" => "application/x-www-form-urlencoded",
         "Authorization" => oauth_header_val,
         "Accept" => "*/*"
     )
  )

  #init stream
  #Requests.ResponseStream{MbedTLS.SSLContext}
  if typ == "POST"
    return Requests.post_streaming(URI("$(endpoint)?$query_str"); headers = headers)
  else
    return Requests.get_streaming(URI("$(endpoint)?$query_str"); headers = headers)
  end
end
