class Author
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has(n, :authorships)
  has(n, :books, :through => :authorships)

  default_scope(:default).update(:order => [:name.asc])  
end