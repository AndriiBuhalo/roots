# frozen_string_literal: true

class Album < ApplicationRecord
  include CreatableBy
  include AttachmentRelations

  validates :name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, length: { minimum: 3, maximum: 1000 }

  accepts_nested_attributes_for :attachments, allow_destroy: true,
                                              reject_if: proc { |attributes| attributes[:file].nil? }
end
