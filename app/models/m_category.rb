class MCategory < ApplicationRecord
  has_many :items
  has_many :s_categories
  belongs_to :l_category
end
