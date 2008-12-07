class Search < Application
  def index(q = '')
    @authors = Author.all(:name.like => "%#{q}%")
    @items = Item.all(:title.like => "%#{q}%")
    render
  end
end
