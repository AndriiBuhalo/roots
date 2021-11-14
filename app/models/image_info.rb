class ImageInfo < ApplicationRecord
  belongs_to :attachment, dependent: :destroy
end
