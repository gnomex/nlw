class Point < ApplicationRecord
  has_many :items

  has_one_attached :image
  
  scope :by_uf, ->(uf) { where(uf: uf) }
  scope :by_city, ->(city) { where(city: city) }
  scope :by_name, ->(name) { where(name: name) }
end
