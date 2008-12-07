class Items < Application
  # provides :xml, :yaml, :js

  def index
    @items = Item.all(:limit => 10)
    display @items
  end

  def show(id)
    @item = Item.get(id)
    @review = Review.new
    raise NotFound unless @item
    display @item
  end

  def new
    only_provides :html
    @item = Book.new
    @publishers = Publisher.all
    @locations = Location.all
    display @item
  end

  def edit(id)
    only_provides :html
    @item = Book.get(id)
    @publishers = Publisher.all
    @locations = Location.all
    raise NotFound unless @item
    display @item
  end

  def create(book)
    @book = Book.new(book)
    if @book.save
      redirect resource(:items), :message => {:notice => "Item was successfully created"}
    else
      message[:error] = "Item failed to be created"
      @publishers = Publisher.all
      @locations = Location.all
      render :new
    end
  end

  def update(id, item)
    @item = Book.get(id)
    raise NotFound unless @item
    if @item.update_attributes(item)
       redirect resource(@item)
    else
      @publishers = Publisher.all
      @locations = Location.all
      display @item, :edit
    end
  end

  def destroy(id)
    @item = Item.get(id)
    raise NotFound unless @item
    if @item.destroy
      redirect resource(:items)
    else
      raise InternalServerError
    end
  end

end # Items
