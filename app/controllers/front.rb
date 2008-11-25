class Front < Application
  def index
    @books = Book.all(:order => [:title.asc])
    display @books
  end
end