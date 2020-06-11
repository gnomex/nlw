require 'fast_jsonapi'

class ItemSerializer
  include FastJsonapi::ObjectSerializer
  
  belongs_to :point

  attributes :title, :description

  attribute :image_url do |obj|
    nil unless obj.image.attached?

    Rails.application.routes.url_helpers.
      rails_blob_url(obj.image, disposition: "inline")
  end
end
