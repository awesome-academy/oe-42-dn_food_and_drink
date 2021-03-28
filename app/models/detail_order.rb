class DetailOrder < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item, optional: true
  belongs_to :cart, optional: true

  before_create :set_quantity

  def total_price
    quantity * item.price
  end

  private
  def set_quantity
    self.quantity = 1
  end
end
