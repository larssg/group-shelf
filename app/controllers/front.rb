class Front < Application
  def index
    @items = Item.latest
    display @items
  end
end