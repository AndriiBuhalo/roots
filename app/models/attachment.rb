class Attachment < ApplicationRecord
  has_many :attachments, as: :attachable
  mount_uploader :file, FileUploader
end
