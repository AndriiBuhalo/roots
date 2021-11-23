class Album < ApplicationRecord
  has_many :attachment_relations, as: :attachable, dependent: :destroy
  has_many :attachments, through: :attachment_relations

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, length: { minimum: 3, maximum: 300 }

  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: proc { |attributes|attributes[:file].nil? }
end
