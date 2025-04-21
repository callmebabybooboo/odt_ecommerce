class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_one_attached :cover_image

  validates :name, :description, :category, :base_price, :status, :stock, presence: true
end
