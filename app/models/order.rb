class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum status: { pending: "pending", paid: "paid" }

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }
end
