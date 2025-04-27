class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  has_many :cart_items
  has_many :carts, through: :cart_items

  CATEGORIES = [ "เสื้อผ้า", "แก้ว", "หมวก", "ของใช้ทั่วไป", "อื่นๆ" ]
  STATUS_OPTIONS = [ "แสดงสินค้า", "ไม่แสดงสินค้า" ]

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :base_price, presence: true
  validates :status, inclusion: { in: STATUS_OPTIONS }
  validates :stock, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :base_price,
    numericality: { greater_than_or_equal_to: 0 },
    format: { with: /\A\d+(\.\d{1,2})?\z/ },
    presence: true
  validates :stock,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 },
    presence: true
  validates :cover_image_url, presence: true
  validate :validate_cover_image_url_format

  private

  def validate_cover_image_url_format
    return if cover_image_url.blank?

    uri = URI.parse(cover_image_url) rescue nil

    unless uri&.is_a?(URI::HTTP) && uri.host.present?
      errors.add(:cover_image_url, "ไม่สามารถเข้าถึงรูปได้ กรุณาตรวจสอบ URL ต้องเป็น URL ที่ถูกต้อง (ต้องขึ้นต้นด้วย http หรือ https)")
    end
  end
end
