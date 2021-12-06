# frozen_string_literal: true

class Post < ApplicationRecord
  include CreatableBy
  
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :content, presence: true, length: { minimum: 5, maximum: 1000 }
end
