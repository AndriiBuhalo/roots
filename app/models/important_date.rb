# frozen_string_literal: true

class ImportantDate < ApplicationRecord
  validates :event, presence: true, length: { minimum: 3, maximum: 50 }
  validates :event_date, presence: true
  validates :description, presence: true, length: { minimum: 3, maximum: 100 }
end
