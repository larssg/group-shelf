class Activity
  include DataMapper::Resource
  
  property :id, Serial
  property :type,         Discriminator
  property :created_at,   DateTime,       :nullable => false, :index => true

  belongs_to :user

  validates_present :user

  before :valid?, :set_timestamp_properties

  def self.recent(how_many = 5)
    all(:limit => how_many, :order => [:created_at.desc])
  end

  class Submission < Activity
    belongs_to :item
    validates_present :item
  end
  
  class BookReview < Activity
    belongs_to :review
    validates_present :review
  end
end