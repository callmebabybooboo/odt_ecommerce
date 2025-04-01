class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
