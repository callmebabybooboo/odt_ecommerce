class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: {
  with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
  message: "รูปแบบอีเมลไม่ถูกต้อง เช่น example@email.com"
  }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }

  def admin?
    role == 1
  end

  def user?
    role == 0
  end

  scope :admin, -> { where(role: 1) }
  scope :user,  -> { where(role: 0) }

  def set_admin!
    update(role: 1)
  end

  def set_user!
    update(role: 0)
  end
end
