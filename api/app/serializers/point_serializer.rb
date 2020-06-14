require 'fast_jsonapi'

class PointSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :email, :about, :instagram, :whatsapp

  attribute :image_url do |obj|
    Rails.application.routes.url_helpers.
      rails_blob_url(obj.image, disposition: "inline") if obj.image.attached?
  end

  attribute :coords do |obj|
    [obj.lat, obj.long]
  end
end
