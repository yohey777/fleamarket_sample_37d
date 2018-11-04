class SCategory < ApplicationRecord
  has_many :items
  has_many :sizes
  belongs_to :m_category
end
