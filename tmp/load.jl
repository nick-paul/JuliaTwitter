include("../src/JuliaTwitter.jl")
using JuliaTwitter

# Set up auth
include("../../auth_setup.jl")
auth = TwAuth(consumer_key, consumer_secret, access_token, access_secret)

include("../src/streaming.jl")


# tweet = JuliaTwitter.get_statuses_home_timeline(auth, Dict())[1]
# println("TWEET:\n",tweet,"END JSON TWEET")
#
# t = JuliaTwitter.Tweet(tweet)
# println("TwObject:\n", t, "END TWOBJECT")
