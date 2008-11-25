class Book
  include DataMapper::Resource

  property :id, Serial
  property :isbn, String, :length => 13
  property :created_at, DateTime
  property :updated_at, DateTime
  property :title, String
  property :pages, Integer
  property :published, Date

  belongs_to :publisher
  belongs_to :location

  has(n, :authorships)
  has(n, :authors, :through => :authorships)
end
