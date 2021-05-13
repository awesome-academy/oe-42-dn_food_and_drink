class DetailOrdersController < ApplicationController
  def index; end

  def show; end

  def new; end

  def create
    chosen_item = Item.find_by(id: params[:item_id])
    current_cart = @current_cart
    build_detail_order chosen_item, current_cart
    if @detail_order.save
      flash[:success] = t("carts.add_cart_success")
    else
      flash[:danger] = t("carts.add_cart_faild")
    end
    redirect_to cart_path(current_cart)
  end

  def destroy
    @detail_order = DetailOrder.find_by(id: params[:id])
    if @detail_order.destroy
      flash[:success] = t("carts.remove_success")
    else
      flash[:danger] = t("carts.remove_faild")
    end
    redirect_to cart_path(@current_cart)
  end

  private

  def detail_order_params
    params.require(:detail_order).permit(:quantity, :item_id, :cart_id)
  end
end
