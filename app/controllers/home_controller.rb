class HomeController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
    load_item_by_cate
  end

  def detail
    load_item
    load_same_item
  end
end
