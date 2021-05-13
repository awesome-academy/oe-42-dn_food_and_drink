class ItemsController < ApplicationController
  before_action :check_cate, only: %i(new create)

  def new
    @item = Category.item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = t "item.create_success"
      redirect_to root_path
    else
      flash.now[:danger] = t "item.create_fail"
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,
                                 :category_id, :description, :price,
                                 :image, :quantity)
  end

  def check_cate
    return if Category.all.empty?

    flash.now[:success] = t "category.no_cate"
    render :new
  end
end
