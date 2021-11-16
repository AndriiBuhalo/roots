class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 , maximum: 50}
  validates :content, presence: true, length: { minimum: 60, maximum: 10000}
end
