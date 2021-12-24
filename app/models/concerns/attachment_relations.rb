# frozen_string_literal: true

module AttachmentRelations
  extend ActiveSupport::Concern

  included do
    has_many :attachment_relations, as: :attachable, dependent: :destroy
    has_many :attachments, through: :attachment_relations
  end
end
