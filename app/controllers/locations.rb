class Locations < Application
  # provides :xml, :yaml, :js

  def index
    @locations = Location.all
    display @locations
  end

  def show(id)
    @location = Location.get(id)
    raise NotFound unless @location
    display @location
  end

  def new
    only_provides :html
    @location = Location.new
    display @location
  end

  def edit(id)
    only_provides :html
    @location = Location.get(id)
    raise NotFound unless @location
    display @location
  end

  def create(location)
    @location = Location.new(location)
    if @location.save
      redirect resource(@location), :message => {:notice => "Location was successfully created"}
    else
      message[:error] = "Location failed to be created"
      render :new
    end
  end

  def update(id, location)
    @location = Location.get(id)
    raise NotFound unless @location
    if @location.update_attributes(location)
       redirect resource(@location)
    else
      display @location, :edit
    end
  end

  def destroy(id)
    @location = Location.get(id)
    raise NotFound unless @location
    if @location.destroy
      redirect resource(:locations)
    else
      raise InternalServerError
    end
  end

end # Locations
