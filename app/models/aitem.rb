class Aitem
  attr_accessor :isbn,  :title,  :image,  :url, :asin, :page
  def initialize(asin, isbn=nil,  title = nil,  url = nil, page = nil,   image = nil)
    @isbn = isbn
    @title = title
    @url = url
    @image = image
    @asin = asin
    @page = page
  end
end

