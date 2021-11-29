# frozen_string_literal: true

class Attachment < ApplicationRecord
  has_many :attachment_relations
  has_many :albums, through: :attachment_relations, source: :attachable,
                    source_type: 'Album', dependent: :destroy
  mount_uploader :file, FileUploader

  validates :file, presence: true
  validates :keyword, length: { minimum: 3, maximum: 50 }
  validates :notes, length: { minimum: 3, maximum: 300 }
  validates :place, length: { minimum: 3, maximum: 150 }
end
