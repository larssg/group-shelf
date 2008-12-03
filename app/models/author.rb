class Author
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :index => true

  has(n, :authorships)
  has(n, :items, :through => :authorships)

  default_scope(:default).update(:order => [:name.asc])
end