# frozen_string_literal: true

class Attachment < ApplicationRecord
  has_many :attachment_relations
  has_many :albums, through: :attachment_relations, source: :attachable,
                    source_type: 'Album', dependent: :destroy
  mount_uploader :file, FileUploader
end
