class Album < ApplicationRecord
  has_many :attachment_relations, :as => :attachable, dependent: :destroy
  has_many :attachments, :through => :attachment_relations
end
