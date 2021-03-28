module ItemsHelper
  def list_category
    Category.all.map{|c| [c.name, c.id]}
  end

  def load_item_by_cate
    @categories = Category.all
    cate = params[:cate]
    return if cate.nil?

    @items = Item.load_cate(cate)
    return unless @items.empty?

    flash.now[:danger] = t("item.no_result_with_cate")
  end

  def load_or_search_item
    if params[:search]
      @items = Item.search_item(params[:search])
      return unless @items.empty?

      flash.now[:danger] = t("item.no_result")
    else
      @items = Item.all
    end
  end
end
