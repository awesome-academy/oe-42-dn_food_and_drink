class Category < ApplicationRecord
  has_many :items, dependent: :destroy

  scope :load_navi, ->{order :name}

  validates :name, presence: true
end
