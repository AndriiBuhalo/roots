class Album < ApplicationRecord
  has_many :attachment_relations, :as => :attachable
  has_many :attachments, :through => :attachment_relations
end
