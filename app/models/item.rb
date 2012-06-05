class Item < ActiveRecord::Base
  has_many :item_users
  has_many :users,  :through => :item_users
  #default_scope :order => "created_at DESC"
  paginates_per 5
  def self.random_get_one
    #_res = find_by_sql("SELECT *, rand() randval FROM items WHERE infocategory != 'CD' ORDER BY randval LIMIT 1;")
    _res = find_by_sql("SELECT * FROM items ORDER BY RANDOM() LIMIT 1;")
    res = _res[0]
    #if res.url
    #res.url = CGI.unescapeHTML res.url
    #else
    #res.url = "http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
    #end
    if res.image.nil?
      url = "http://ajax.googleapis.com/ajax/services/search/images?safe=activersz=large&start=0&v=1.0&q=#{CGI.escape(res.title)}"
      json_results = open(url) {|f| f.read };
      results = JSON.parse(json_results)
      image_array = results['responseData']['results']
      image = image_array[0] if image_array
      res.image = image['unescapedUrl']
      #google_image = self.new(:thumbnail => image['tbUrl'], :original => image['unescapedUrl'], :position => position, :name => keyword.titleize)
    end

    #if res.image
    #res.image = CGI.unescapeHTML res.image
    #else
    #res.image = "http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
    #end
    res
  end

  def self.setimage item
    url = "http://search.yahooapis.jp/PremiumImageSearchService/V1/imageSearch?appid=OELf1uSxg65o11wYS74A49l69gB.kqvF1N1y9OfuQbYzqEA8jkX7MFIk1DDKUBM-&query=#{CGI.escape(item.title)}"
    json_results = open(url) {|f| f.read };
    results = Nokogiri::XML.parse(json_results)
    image = results.search('Url').first.text
    if image
      if image.include?("fc2")
        #item.image = "http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
        item.image = "http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
      elsif image.include?("ameba")
        item.image ="http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
      elsif image.include?("exca")
        item.image ="http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
      elsif image.include?("blogs.yahoo")
        item.image ="http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
      else
        item.image = image
      end

    else
      item.image = "http://jpn-ex.com/wp-content/uploads/2011/09/noImage.jpg"
    end
  end

end
