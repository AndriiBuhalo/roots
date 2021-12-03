# frozen_string_literal: true

class Attachment < ApplicationRecord
  has_many :attachment_relations
  has_many :albums, through: :attachment_relations, source: :attachable,
                    source_type: 'Album', dependent: :destroy
  mount_uploader :file, FileUploader

  validates :file, presence: true

  before_create :set_original_file_name
  def set_original_file_name
    self.file_name = file.send(:original_filename)
  end
end
