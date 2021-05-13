module DetailOrdersHelper
  def build_detail_order chosen_item, current_cart
    if current_cart.items.include?(chosen_item)
      @detail_order = current_cart.detail_orders.find_by(item_id: chosen_item)
      @detail_order.quantity += 1
    else
      @detail_order = DetailOrder.new
      @detail_order.cart = current_cart
      @detail_order.item = chosen_item
    end
  end
end
