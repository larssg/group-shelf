module GroupShelf
  class Saxo
    def self.fetch(config, isbn)
      key = config[:saxo_api_key]
      doc = fetch_book(key, isbn)
      return nil if doc.nil?

      data = { :isbn => isbn }
      item = doc.at('itemdata')
      if item
        data[:title] = (item/:title).innerHTML
        data[:pages] = (item/:pagecount).innerHTML
        data[:published] = (item/:releasedate).innerHTML
        data[:publisher] = ((item/:publisher)/:name).innerHTML

        item_id = (item/:id).first.innerHTML
        data[:images] = []
        data[:images] << { :size => 'small', :url => "http://images.saxo.com/ItemImage.aspx?ItemID=#{item_id}&Height=75", :height => 75 }
        data[:images] << { :size => 'medium', :url => "http://images.saxo.com/ItemImage.aspx?ItemID=#{item_id}&Height=160", :height => 160 }
        data[:images] << { :size => 'large', :url => "http://images.saxo.com/ItemImage.aspx?ItemID=#{item_id}&Height=500", :height => 500 }

        unless (item/:description/:subjects).innerHTML
          data[:description] = (item/:description).innerHTML.gsub('&lt;', '<').gsub('&gt;', '>').gsub('<br>', "\n").gsub('<br/>', "\n").gsub('&amp;', '&')
        end

        data[:authors] = []
        (item/:author).each do |author_element|
          data[:authors] << (author_element/:name).innerHTML
        end
        
        return data
      end
      nil
    end

    protected
    def self.fetch_book(key, isbn)
      # First we look up the item id using the isbn number
      xml = Curl::Easy.perform("http://api.saxo.com/v1/ItemService.asmx/FindItem?developerKey=#{key}&sessionKey=&keyword=#{isbn}&keywordType=ISBN").body_str
      doc = Hpricot.parse(xml)

      return nil if doc.nil?
      item_id = (doc/"itemresult/items/item/id").innerHTML

      # Then we look up the details
      detail_url = "http://api.saxo.com/v1/ItemService.asmx/GetItemData?developerKey=#{key}&sessionKey=&itemId=#{item_id}"
      begin
        xml = Curl::Easy.perform(detail_url).body_str
        return Hpricot.parse(xml)
      rescue
        logger.debug { "SAXO call failed: #{detail_url}" }
        logger.debug { "from response:\n#{doc}" }
      end 
      nil
    end
  end
end