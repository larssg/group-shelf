class Front < Application
  def index
    @items = Item.latest
    @activity = Activity.recent
    display @items
  end
end