# frozen_string_literal: true

class AttachmentRelation < ApplicationRecord
  belongs_to :attachment
  belongs_to :attachable, polymorphic: true

  validates :attachment_id, uniqueness: { scope: :attachable_id }
end
