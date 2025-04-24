class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  STATUS_MAP = {
    0 => "pending",
    1 => "paid",
    2 => "cancelled"
  }.freeze

  validates :total_price, numericality: { greater_than_or_equal_to: 0 }

  def status_text
    I18n.t("order.statuses.#{status}")
  end

  def pending?
    status == 0
  end

  def paid?
    status == 1
  end

  def cancelled?
    status == 2
  end
end
