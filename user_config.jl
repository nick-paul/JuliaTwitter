#User OAuth data goes here
USER_AUTH_DICT = Dict(
  :consumer_key => "tk08Qsxo8up6yird80H4Cxtvx",
  :consumer_secret => "fqmA5uOA0E6LlH2ZN70fU9N3k9Y3Lke1JYyYV1S5io1fhJpf07",
  :access_token => "3992352073-CFvHGdrVmma6Y93sk4lOdpHOO4lL2GN0hmCYXQS",
  :access_secret => "EleK4UZ29Tukdf8ofKEDFgKgxvsKpqF5WjCFC07byhBVF"
)


#DBHandles
#Comment out to de-activate


#include("dbhandle/TwTXTFile.jl")
include("dbhandle/TwMongoDB.jl")
