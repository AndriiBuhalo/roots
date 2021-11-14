class Attachment < ApplicationRecord
  has_many :attachment_relations
  has_many :albums, :through => :attachment_relations, :source => :attachable,
           :source_type => 'Album'
  mount_uploader :file, FileUploader
end
