class Book
  include DataMapper::Resource

  property :id, Serial
  property :isbn, String, :length => 13
  property :created_at, DateTime
  property :updated_at, DateTime
  property :title, String
  property :pages, Integer
  property :published, Date
  property :description, Text

  belongs_to :publisher
  belongs_to :location

  has(n, :authorships)
  has(n, :authors, :through => :authorships)
  has(n, :reviews)
  
  default_scope(:default).update(:order => [:title.asc])  
  
  def stars
    @stars ||= self.reviews.empty? ? 0.0 : ((self.reviews.avg(:score) * 2).round / 2.0)
  end
end
