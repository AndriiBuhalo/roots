class Album < ApplicationRecord
  has_many :attachments, as: :attachable
end
