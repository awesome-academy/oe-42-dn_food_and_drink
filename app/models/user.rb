class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy

  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true
  validates :email, presence: true,
    length: {maximum: Settings.user.email.size},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: true
  validates :phone, presence: true
  validates :address, presence: true

  has_secure_password

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create string, cost: cost
  end

  private

  def downcase_email
    email.downcase!
  end
end
