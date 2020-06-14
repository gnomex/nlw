class Item < ApplicationRecord
  has_and_belongs_to_many :points

  has_one_attached :image
end
