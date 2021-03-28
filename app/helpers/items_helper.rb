module ItemsHelper
  def list_category
    Category.all.map{|c| [c.name, c.id]}
  end

  def load_item_by_cate
    cate = params[:cate]
    return if cate.nil?

    @items = Item.load_cate cate
  end

  def load_item
    @item = Item.find_by(id: params[:id])
  end

  def load_same_item
    samecate = params[:same_cate]
    @item_same_cate = Item.same_cate samecate
  end
end
