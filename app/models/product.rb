class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_one_attached :cover_image
  has_many_attached :images

  CATEGORIES = [ "เสื้อผ้า", "แก้ว", "หมวก", "ของใช้ทั่วไป", "อื่นๆ" ]
  STATUS_OPTIONS = [ "แสดงสินค้า", "ไม่แสดงสินค้า" ]

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :base_price, presence: true
  validates :status, presence: true
  validates :stock, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :base_price,
    numericality: { greater_than_or_equal_to: 0 },
    format: { with: /\A\d+(\.\d{1,2})?\z/ },
    presence: true
  validates :stock,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 },
    presence: true
  validates :cover_image,
    attached: true,
    content_type: [ "image/png", "image/jpeg" ],
    size: { less_than: 10.megabytes }
  validates :status, inclusion: { in: STATUS_OPTIONS }
end
