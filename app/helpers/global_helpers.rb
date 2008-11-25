module Merb
  module GlobalHelpers
    def title(*args)
      @page_title = *args
    end
    
    def page_title(prefix = nil)
      ret = [prefix, @page_title].flatten.compact.join(': ')
      ret.size > 0 ? ret : false
    end
  end
end
