class AttachmentRelation < ApplicationRecord
  belongs_to :attachable, polymorphic: true
end
