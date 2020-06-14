class Point < ApplicationRecord
  has_and_belongs_to_many :items

  has_one_attached :image
  
  scope :by_uf, ->(uf) { where(uf: uf) }
  scope :by_city, ->(city) { where(city: city) }
  scope :by_name, ->(name) { where(name: name) }
  scope :by_items, ->(ids) { joins(:items).where(items: { id: ids }) }
end
