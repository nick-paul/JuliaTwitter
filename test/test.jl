include("../src/JuliaTwitter.jl")
using JuliaTwitter
peeps = get_followers(auth, Dict())
dani = peeps[1]
twDani = TwUser(dani)
