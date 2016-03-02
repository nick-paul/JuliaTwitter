include("load.jl")
using PyPlot

"""
Basic demo function that compares the average favorites for tweets
mentioning the word "cat" and the word "dog". The averages are then
plotted as a bar chart and displayed.
"""
function cats_and_dogs()
  # Set up twitter search queries
  cat_q = Dict("q" => "cat", "result_type" => "popular", "count" => "100")
  dog_q = Dict("q" => "dog", "result_type" => "popular", "count" => "100")

  # Get tweets
  search_cats = get_search(auth, cat_q)
  search_dogs = get_search(auth, dog_q)

  # Convert tweets to Tweet objects
  cat_t = map(Tweet, search_cats["statuses"])
  dog_t = map(Tweet, search_dogs["statuses"])

  # Gather favorite count
  cat_favs = [get(cat_t[i].favorite_count) for i = 1:length(cat_t)]
  dog_favs = [get(dog_t[i].favorite_count) for i = 1:length(dog_t)]

  # Plot average favorite count
  bar(["cats", "dogs"],
      [avg(cat_favs), avg(dog_favs)],
      color="#0f87bf",
      align="center",
      alpha=0.4)
  title("Average Favorite Count Among Top Tweets")

end

# Basic function for calculating the average of a list
avg(x) = sum(x)/length(x)


function follow_count(x::ASCIIString)
  q = Dict("q" => "@$x")

  user_dict = get_users_search(auth, q)

  user = TwUser(user_dict[1])

  println("@$x has $(user.followers_count) followers")
end
