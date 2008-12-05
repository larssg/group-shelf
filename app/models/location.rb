class Location
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  
  has(n, :items)

  default_scope(:default).update(:order => [:name.asc])  
end