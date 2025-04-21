class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_one_attached :cover_image

  validates :name, :description, :category, :base_price, :status, :stock, presence: true

  CATEGORIES = ["เสื้อผ้า", "แก้ว", "หมวก", "ของใช้ทั่วไป", "อื่นๆ"]
  validates :category, inclusion: { in: CATEGORIES, message: "กรุณาเลือกหมวดหมู่" }
end
