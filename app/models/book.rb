class Book
  include DataMapper::Resource

  property :id, Serial
  property :isbn, String, :length => 13
  property :created_at, DateTime
  property :updated_at, DateTime
  property :title, String, :length => 255
  property :pages, Integer
  property :published, Date
  property :description, Text
  property :detail_url, String, :length => 255

  belongs_to :publisher
  belongs_to :location

  has(n, :authorships)
  has(n, :authors, :through => :authorships)
  has(n, :reviews)
  
  before :save, :cleanup_isbn
  after :create, :load_data
  
  default_scope(:default).update(:order => [:title.asc])

  def stars
    @stars ||= self.reviews.empty? ? 0.0 : ((self.reviews.avg(:score) * 2).round / 2.0)
  end
  
  def isbn_10
    ISBN_Tools.hyphenate_isbn10(self.isbn)
  end
  
  def isbn_13
    ISBN_Tools.hyphenate_isbn13(ISBN_Tools.isbn_10_to_isbn13(self.isbn))
  end

  protected
  def cleanup_isbn
    self.isbn = ISBN_Tools.isbn13_to_isbn10(self.isbn) if ISBN_Tools.is_valid_isbn13?(self.isbn)
    self.isbn = ISBN_Tools.cleanup(self.isbn)
  end
  
  def load_data
    return unless self.title.blank?
    return if self.isbn.blank?
    
    data = fetch_from_providers
    return if data.nil?

    self.title = data[:title]
    self.pages = data[:pages]
    self.published = data[:published]
    self.detail_url = data[:detail_url]
    self.description = data[:description]
    
    data[:authors].each do |name|
      author = Author.first(:name => name) || Author.new(:name => name)
      Authorship.create(:book => self, :author => author)
    end
    
    self.publisher = Publisher.first(:name => data[:publisher]) || Publisher.new(:name => data[:publisher])

    save!
  end
  
  def fetch_from_providers
    Merb.config[:book_providers].each do |provider|
      data = provider.fetch(Merb.config, self.isbn)
      return data unless data.nil?
    end
    nil
  end
end