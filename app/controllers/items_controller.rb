class ItemsController < ApplicationController
  def new
    @item = Item.new
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
end
