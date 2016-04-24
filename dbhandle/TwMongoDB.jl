using Mongo

type TwMongoDB <: TwitterDB
  db::MongoClient
  col::MongoCollection

  function TwMongoDB(db_name::AbstractString, col_name::AbstractString)
    mongo_client = MongoClient()
    mongo_collection = MongoCollection(mongo_client, db_name, col_name)
    new(mongo_client, mongo_collection)
  end

end

function add_entry(tmc::TwMongoDB, d::Dict{AbstractString, Any})
  insert(tmc.col, d)
end

function close_db(tmc::TwMongoDB)
  #Not needed
end
