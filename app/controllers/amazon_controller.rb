class AmazonController < ApplicationController
  def index
    if request.get?
    else
      @keyword = params[:keyword]
      res = Amazon::Ecs.item_search(@keyword,  {
        :search_index => 'Books',
        :response_group => 'Medium',
        :sort => 'salesrank'
      })
      @aitems = []
      res.items.each do |item|
        @aitems << Aitem.new(
          item.get_unescaped('ASIN'),
          item.get_unescaped('ItemAttributes/ISBN'),
          item.get_unescaped('ItemAttributes/Title'),
          item.get_unescaped('DetailPageURL'),
          item.get_unescaped('ItemAttributes/NumberOfPages'),
          item.get_hash('SmallImage')
        )
      end
    end
  end
end
