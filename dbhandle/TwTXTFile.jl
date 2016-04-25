#The TwTXTFile type writes the text of a tweet as a new line in a text file
#This type exists more for demonstration purposes and is not intended
#   to be used for large scale data mining
type TwTXTFile <: TwitterDB
  file::IOStream

  #Create a TwTXTFile object given the path of the .txt file
  function TwTXTFile(path::AbstractString)
    #a -> write, create, append
    new(open(path, "a"))
  end

end


#This function takes a dictionary (returned by the streaming API)
#   and writes it to the "database"
function add_entry(t::TwTXTFile, d::Dict{AbstractString, Any})
  #Write the text of the tweet to the file
  write(t.file, d["text"])
  write(t.file, '\n')
end

#This function is called once all of
#   the requested tweets have been written
function close_db(t::TwTXTFile)
  close(t.file)
end
