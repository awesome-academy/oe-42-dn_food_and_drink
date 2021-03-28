class HomeController < ApplicationController
  def index
    load_or_search_item
    load_item_by_cate
  end
end
