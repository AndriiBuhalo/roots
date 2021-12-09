# frozen_string_literal: true

class ImportantDate < ApplicationRecord
  include CreatableBy

  validates :event_name, presence: true, length: { minimum: 3, maximum: 255 }
  validates :event_date, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
end
