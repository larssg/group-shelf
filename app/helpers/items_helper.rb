module Merb
  module ItemsHelper
    def padding_style(image)
      return nil if image.nil?
      return "margin-left: #{image.width + 10}px" if image.width && image.width > 0
      nil
    end
  end
end # Merb