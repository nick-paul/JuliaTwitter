include("src/JuliaTwitter.jl")
using JuliaTwitter


#Parses a string into a number if it can be represented as one
parse_if_num(s::AbstractString) = isa(parse(s), Number)  ? parse(s) : s
parse_if_num(s::Number) = s

#Evaluates a function with the given args as strings
function eval_str(fn::AbstractString, args...)
  #Parse the arguments
  parsed_args = map(parse_if_num, [args...])

  #Evaluate the parsed expression
  eval(Expr(:call, parse(fn), parsed_args...))
end

VALID_ARG_NAMES = Dict(
  #Maximum number of tweets to search for
  "-tweets" => "maxtweets",
  "-n" => "maxtweets",
  #Query
  "-query" => "query",
  "-q" => "query",
  #Max time to continue searching
  "-time" => "time",
  "-t" => "time",
  #Databse Handle
  "-dbh" => "dbh",
  #Alert Every
  "-alert-every" => "alertevery",
  "-a" => "alertevery",
  #Max consecutive errors
  "-max-errors" => "maxerrors",
  "-e" => "maxerrors"

)

function is_valid_arg(s::AbstractString)
  haskey(VALID_ARG_NAMES, s)
end

proper_argname(s::AbstractString) = VALID_ARG_NAMES[s]


function parse_args(args)#::Array{AbstractString, 1})
  dict = Dict{AbstractString, Union{Int, AbstractString}}(
    "maxtweets" => 100000,
    "time" => 60,
    "alertevery" => 20,
    "maxerrors" => 3
  )

  ix = 1
  while ix < length(args)
    try
      if is_valid_arg(args[ix])
        dict[proper_argname(args[ix])] = args[ix+1]
      else
        print_with_color(:red, "$(args[ix]) is not a valid argument\n")
        throw(error("Invalid argument"))
      end
    catch y
      println(y)
      print_with_color(:red, "Invalid argument near $(args[ix])\n")
      throw(error("Invalid argument"))
    end
    ix += 2
  end

  #Check for dbh
  if !haskey(dict, "dbh")
    println("[ERROR] Database not provided. Use -dbh "" to provide.")
    error("database not provided")
  end

  #Check for q
  if !haskey(dict, "q")
    println("[ERROR] Query not provided. Use -q "" to provide.")
    error("query not provided")
  end

  #Convert numbers
  dict["maxtweets"] = parse_if_num(dict["maxtweets"])
  dict["time"] = parse_if_num(dict["time"])
  dict["alertevery"] = parse_if_num(dict["alertevery"])
  dict["maxerrors"] = parse_if_num(dict["maxerrors"])

  #Check numbers
  typeof(dict["maxtweets"]) != Int && throw(ArgumentException(string("Cannot parse input for maxtweets: ", dict["maxtweets"])))
  typeof(dict["time"]) != Int && throw(ArgumentException(string("Cannot parse input for time: ", dict["time"])))
  typeof(dict["alertevery"]) != Int && throw(ArgumentException(string("Cannot parse input for alertevery: ", dict["alertevery"])))
  typeof(dict["maxerrors"]) != Int && throw(ArgumentException(string("Cannot parse input for maxerrors: ", dict["maxerrors"])))

  return dict
end

function create_dbh(in_str::AbstractString)
  in_str = string("JuliaTwitter.", in_str)
  eval(parse(in_str))
end

function main()
  println("Julia Loaded")
  #Parse and validate all arguments
  args = parse_args(ARGS)
  println("Using arguments:")
  println("\tMax number of tweets:\t", args["maxtweets"])
  println("\tMax time to search:\t", args["time"])
  println("\tQuery:\t\t\t", args["query"])
  println("\tDatabase:\t\t", args["dbh"])
  println("\tMax consecutive errors:\t", args["maxerrors"])
  println("\tAlert every N tweets:\t", args["alertevery"])

  dbh = 0
  try
    dbh = create_dbh(args["dbh"])
  catch y
    println("[ERROR] Could not initialize database: ", args["dbh"])
    println("        See error message below")
    throw(y)
  end
  println("Successfully initialized database: ", dbh)

  options = Dict("track" => args["query"])

  println("Starting stream...")
  stream_tweets(JuliaTwitter.auth, dbh, options;
        max_tweets = args["maxtweets"],
        max_time = args["time"],
        alert_every = args["alertevery"],
        max_err_attemps = args["maxerrors"])

  println("Complete.")
end

main()

#=
Load 10 trump tweets into a file

julia stream_tweets.jl -dbh TwTXTFile(\"path/to/txtfile.txt\") -maxtweets 10 -q Trump


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
