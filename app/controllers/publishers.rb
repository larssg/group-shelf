class Publishers < Application
  # provides :xml, :yaml, :js

  def index
    @publishers = Publisher.all
    display @publishers
  end

  def show(id)
    @publisher = Publisher.get(id)
    raise NotFound unless @publisher
    display @publisher
  end

  def new
    only_provides :html
    @publisher = Publisher.new
    display @publisher
  end

  def edit(id)
    only_provides :html
    @publisher = Publisher.get(id)
    raise NotFound unless @publisher
    display @publisher
  end

  def create(publisher)
    @publisher = Publisher.new(publisher)
    if @publisher.save
      redirect resource(@publisher), :message => {:notice => "Publisher was successfully created"}
    else
      message[:error] = "Publisher failed to be created"
      render :new
    end
  end

  def update(id, publisher)
    @publisher = Publisher.get(id)
    raise NotFound unless @publisher
    if @publisher.update_attributes(publisher)
       redirect resource(@publisher)
    else
      display @publisher, :edit
    end
  end

  def destroy(id)
    @publisher = Publisher.get(id)
    raise NotFound unless @publisher
    if @publisher.destroy
      redirect resource(:publishers)
    else
      raise InternalServerError
    end
  end

end # Publishers
