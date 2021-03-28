class Cart < ApplicationRecord
  has_many :detail_orders, dependent: :destroy
  has_many :items, through: :detail_orders

  def sub_total
    sum = 0
    detail_orders.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end
end
