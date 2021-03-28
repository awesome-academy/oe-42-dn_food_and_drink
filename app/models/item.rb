class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :category

  has_one_attached :image
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  scope :load_cate, ->(cate){where(category_id: cate)}
  scope :search_item, ->(search){where("name LIKE ? ", "%#{search}%")}

  has_one_attached :image
  validates :image, content_type: {in: %w(image/jpeg image/gif image/png),
                                   message:
                                    I18n.t("item.image_1")},
   size: {less_than: 5.megabytes, message:
    I18n.t("item.image_2")}

  def display_image
    image.variant resize_to_limit: [Settings.item.image.default,
      Settings.item.image.default]
  end
end
