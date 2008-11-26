module GroupShelf
  class Amazon
    def self.fetch(config, isbn)
      key = config[:amazon_api_key]
      doc = fetch_book(key, isbn)
      return nil if doc.nil?

      data = { :isbn => isbn }
      (doc/:item).collect do |item|
        data[:title] = (item/:title).innerHTML
        data[:pages] = (item/:numberofpages).innerHTML
        data[:published] = (item/:publicationdate).innerHTML
        data[:detail_url] = (item/:detailpageurl).innerHTML
        data[:publisher] = (item/:publisher).innerHTML
        data[:description] = (item/:editorialreview/:content).innerHTML.gsub('&lt;', '<').gsub('&gt;', '>')

        data[:images] = []
        data[:images] << xml_to_image(item/:smallimage, :small)
        data[:images] << xml_to_image(item/:mediumimage, :medium)
        data[:images] << xml_to_image(item/:largeimage, :large)

        data[:authors] = []
        (item/:author).each do |author_element|
          data[:authors] << author_element.innerHTML
        end
        
        return data
      end
      nil
    end
    
    protected
    def self.fetch_book(key, isbn)
      %w(webservices.amazon.com webservices.amazon.co.uk webservices.amazon.de).each do |domain|
        xml = Curl::Easy.perform("http://#{domain}/onca/xml?Service=AWSECommerceService&SubscriptionId=#{key}&Operation=ItemLookup&ResponseGroup=Medium&ItemId=#{isbn}").body_str
        doc = Hpricot.parse(xml)
        return doc if (doc/:item).size > 0
      end
      nil
    end
    
    def self.xml_to_image(xml, size)
      {
        :size => size,
        :url => (xml/:url).first.innerHTML,
        :width => (xml/:width).first.innerHTML,
        :height => (xml/:height).first.innerHTML
      }
    rescue
      nil
    end
  end
end