require 'fast_jsonapi'

class PointSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :about, :instagram, :whataspp, :coords, :image

  attribute :image do |obj|
    nil unless obj.image.attached?

    Rails.application.routes.url_helpers.
      rails_blob_url(obj.image, disposition: "attachment")
  end

  attribute :coords do |obj|
    [obj.lat, obj.long]
  end
end
