class ServiceController < ApplicationController
  require 'json'
  require 'open-uri'
  def like
    if params[:before_item]
      @before_item = Item.find(params[:before_item])
      if current_user
        @before_item.users << current_user
      end
    end
    i = Item.arel_table
    @items_origin = Item.where(i[:infocategory].eq("映画"));
    if params[:program]
      @items_origin= @items_origin.where(i[:program].matches(params[:program]).or(i[:program].matches(params[:program2])).or(i[:program].matches(params[:program3]))).order("RANDOM()").limit(3)

      if params[:title]||params[:created_at]
        if params[:title]
          @items_origin = @items_origin.where(:title=>params[:title])
        end
        if params[:created_at]
          @items_origin = @items_origin.where(:created_at => params[:created_at])
        end
        @item = @items_origin.first
      else
        @item = @items_origin.order("RANDOM()").limit(1).first
      end
    else
      @item = @items_origin.order("RANDOM()").limit(1).first
    end
    #@item = Item.first
    @count = params[:count].to_i || 0
    @count += 1
    Item.setimage @item
  end
  def match
  end
  def talk
  end
  def filter
  end

end
