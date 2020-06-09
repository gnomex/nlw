require 'fast_jsonapi'

class PointSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :about, :instagram, :whataspp, :coords, :image

  attribute :coords do |obj|
    [obj.lat, obj.long]
  end
end
