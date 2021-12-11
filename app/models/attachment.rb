# frozen_string_literal: true

class Attachment < ApplicationRecord
  include CreatableBy

  has_many :attachment_relations
  has_many :albums, through: :attachment_relations, source: :attachable,
                    source_type: 'Album'

  mount_uploader :file, FileUploader
  validates :file, presence: true

  before_create :set_original_file_name

  private

  def set_original_file_name
    self.original_filename = file.send(:original_filename)
  end
end
