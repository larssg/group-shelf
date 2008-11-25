class Authors < Application
  # provides :xml, :yaml, :js

  def index
    @authors = Author.all
    display @authors
  end

  def show(id)
    @author = Author.get(id)
    raise NotFound unless @author
    display @author
  end

  def new
    only_provides :html
    @author = Author.new
    display @author
  end

  def edit(id)
    only_provides :html
    @author = Author.get(id)
    raise NotFound unless @author
    display @author
  end

  def create(author)
    @author = Author.new(author)
    if @author.save
      redirect resource(@author), :message => {:notice => "Author was successfully created"}
    else
      message[:error] = "Author failed to be created"
      render :new
    end
  end

  def update(id, author)
    @author = Author.get(id)
    raise NotFound unless @author
    if @author.update_attributes(author)
       redirect resource(@author)
    else
      display @author, :edit
    end
  end

  def destroy(id)
    @author = Author.get(id)
    raise NotFound unless @author
    if @author.destroy
      redirect resource(:authors)
    else
      raise InternalServerError
    end
  end

end # Authors
