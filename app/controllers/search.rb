class Search < Application
  def index(q = '')
    @authors = Author.all(:name.like => "%#{q}%")
    @items = Item.all(:conditions => ["title LIKE ? OR description LIKE ?", "%#{q}%", "%#{q}%"])
    render
  end
end
