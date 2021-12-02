# frozen_string_literal: true

class CreateImportantDates < ActiveRecord::Migration[6.1]
  def change
    create_table :important_dates do |t|
      t.text :event
      t.date :event_date
      t.string :description

      t.timestamps
    end
  end
end
