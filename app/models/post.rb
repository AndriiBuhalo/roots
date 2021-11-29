# frozen_string_literal: true

class Post < ApplicationRecord
  include CreatableBy
  validates :title, presence: true, length: { minimum: 3, maximum: 20 }
  validates :content, presence: true, length: { minimum: 5, maximum: 100 }
end
