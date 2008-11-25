class Author
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has(n, :authorships)
  has(n, :books, :through => :authorships)
end