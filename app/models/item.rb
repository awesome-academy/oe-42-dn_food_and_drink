class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :detail_orders, dependent: :destroy
  belongs_to :category
  belongs_to :cart, optional: true

  has_one_attached :image
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  scope :load_cate, ->(cate){where(category_id: cate)}
  scope :search_item, ->(search){where("name LIKE ? ", "%#{search}%")}
  scope :same_cate, ->(samecate){where(category_id: samecate)}

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

  def display_image_same_item
    image.variant resize_to_limit: [Settings.item.image.same_item,
      Settings.item.image.same_item]
  end
end
