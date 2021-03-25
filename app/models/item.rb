class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :category

  has_one_attached :image
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :image, content_type: {in: %w(image/jpeg image/gif image/png),
                                   message:
                                    I18n.t("item.image_1")},
   size: {less_than: 5.megabytes, message:
    I18n.t("item.image_2")}
end
