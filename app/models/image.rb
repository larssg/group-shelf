class Image
  include DataMapper::Resource
  
  property :id, Serial
  property :size, String
  property :url, String, :length => 255
  property :width, Integer
  property :height, Integer

  belongs_to :item, :index => true
  
  def self.small
    first(:size => 'small')
  end
  
  def self.medium
    first(:size => 'medium')
  end
  
  def self.large
    first(:size => 'large')
  end
end