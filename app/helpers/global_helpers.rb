module Merb
  module GlobalHelpers
    def title(*args)
      @page_title = *args
    end
    
    def page_title(prefix = nil)
      ret = [prefix, @page_title].flatten.compact.join(': ')
      ret.size > 0 ? ret : false
    end

    def item_image(image)
      size = {}
      size[:width] = image.width if image.width.to_i > 0
      size[:height] = image.height if image.height.to_i > 0
      image_tag(image.url, size)
    end
  end
end
