class HomeController < ApplicationController
  before_action :load_item_by_cate, only: %i(index)

  def index
    @items = Item.paginate(page: params[:page],
      per_page: Settings.item.item_on_page).sort_by_name
    @categories = Category.load_navi
    load_item_by_cate
  end

  private

  def load_item_by_cate
    return if params[:cate].nil?

    @items = Item.paginate(page: params[:page], per_page:
      Settings.item.item_on_page).load_cate(params[:cate]).sort_by_name
    return unless @items.empty?

    flash.now[:danger] = t("item.no_result_with_cate")
  end
end
