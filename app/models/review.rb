class Review
  include DataMapper::Resource
  
  property :id, Serial
  property :body, Text, :nullable => false
  property :created_at, DateTime, :nullable => false, :index => true
  property :score, Integer, :nullable => false, :index => true

  belongs_to :user
  belongs_to :item, :index => true, :counter_cache => true

  validates_present :user, :item

  after :create, :record_activity

  default_scope(:default).update(:order => [:created_at.desc])

  def record_activity
    Activity::BookReview.create(:review => self, :user => self.user)
  end
end
