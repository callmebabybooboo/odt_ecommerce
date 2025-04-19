class OptionValue < ApplicationRecord
  belongs_to :option
  has_and_belongs_to_many :variants
end
