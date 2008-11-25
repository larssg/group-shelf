class Front < Application
  def index
    @books = Book.all
    display @books
  end
end