class Size < ApplicationRecord
  has_many :items
  belongs_to :s_category
end
