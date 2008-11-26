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
  
  after :create, :load_data
  
  default_scope(:default).update(:order => [:title.asc])

  def stars
    @stars ||= self.reviews.empty? ? 0.0 : ((self.reviews.avg(:score) * 2).round / 2.0)
  end

  protected
  def load_data
    return unless self.title.blank?
    return if self.isbn.blank?

    data = ::ISBNDB.fetch_by_isbn(self.isbn)

    self.title = data[:long_title]
    self.title = data[:short_title] if self.title.strip.blank?
    
    data[:author].split(', ').each do |name|
      author = Author.first(:name => name) || Author.new(:name => name)
      Authorship.create(:book => self, :author => author)
    end
    
    self.publisher = Publisher.first(:name => data[:publisher]) || Publisher.new(:name => data[:publisher])

    save
  end
end