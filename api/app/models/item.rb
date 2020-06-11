class Item < ApplicationRecord
  belongs_to :point, optional: true

  has_one_attached :image

  # before_save :scan_for_viruses

  # private

  # def scan_for_viruses
  #   return unless self.attachment_changes['image']
  #   path = self.attachment_changes['image'].attachable.tempfile.path
  #   Clamby.safe?(path)
  # end
end
