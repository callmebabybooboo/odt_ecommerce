class Variant < ApplicationRecord
  belongs_to :product
  has_and_belongs_to_many :option_values
end
