class Review
  include DataMapper::Resource
  
  property :id, Serial
  property :body, Text, :nullable => false
  property :created_at, DateTime, :nullable => false, :index => true
  property :score, Integer, :nullable => false, :index => true

  belongs_to :user
  belongs_to :item, :index => true

  validates_present :user, :item

  default_scope(:default).update(:order => [:created_at.desc])
end
