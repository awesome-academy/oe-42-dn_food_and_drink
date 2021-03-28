class HomeController < ApplicationController
  def index
    load_or_search_item
    load_item_by_cate
  end

  def detail
    @item = Item.find_by(id: params[:id])
    load_same_item
  end
end
