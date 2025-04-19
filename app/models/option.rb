class Option < ApplicationRecord
  has_many :option_values, dependent: :destroy
end
