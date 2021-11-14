class AttachmentRelation < ApplicationRecord
  belongs_to :attachment
  belongs_to :attachable, polymorphic: true
end
