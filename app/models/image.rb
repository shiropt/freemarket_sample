class Image < ApplicationRecord
  mount_uploaders :image, ImageUploader
  belongs_to :item
end
