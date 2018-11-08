class Image < ApplicationRecord
  belongs_to :item,optional: true
  # carrierwaveとの関連づけ
  mount_uploader :image_url, ImageUploader
end
