require 'fast_jsonapi'

class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description

  attribute :image do |obj|
    nil unless obj.image.attached?

    Rails.application.routes.url_helpers.
      rails_blob_url(obj.image, disposition: "attachment")
  end
end
