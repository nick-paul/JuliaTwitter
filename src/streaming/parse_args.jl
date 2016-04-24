#Parses a string into a number if it can be represented as one
parse_if_num(s::AbstractString) = isa(parse(s), Number)  ? parse(s) : s

#Evaluates a function with the given args as strings
function eval_str(fn::AbstractString, args...)
  #Parse the arguments
  parsed_args = map(parse_if_num, [args...])

  #Evaluate the parsed expression
  eval(Expr(:call, parse(fn), parsed_args...))
end

function parse_args(args)#::Array{AbstractString, 1})
  dict = Dict{UTF8String, Any}(
    "max-tweets" => 10,
    "query" => "trump",
    "time" => 60,
    "db-handle" => "TwTXTFile.jl"
  )

  return dict
end



#=
Load 10 trump tweets into a file

julia stream_tweets.jl -dbh TwTXTFile -arg1 "path/to/txtfile.txt" -maxtweets 10 -q Trump


Possible arguments
-max-tweets (-m) <number>
  the maximum number of tweets to return
-query (-q) <string>
  the query
-time (-t) <number>
  the max number of seconds to search
  -time-<<unit>> (-t-<<unit>>) <number>
  the max number of <<unit>> to search
  will be converted to seconds before entering into dict
  example:
    -t-hour 4

-db-handle (-d) <string>
=#
