class Order < ApplicationRecord
  has_many :detail_orders, dependent: :destroy
  belongs_to :user, optional: true
end
