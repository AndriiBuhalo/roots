# frozen_string_literal: true

class CreateImportantDates < ActiveRecord::Migration[6.1]
  def change
    create_table :important_dates do |t|
      t.string :event_name
      t.date :event_date
      t.text :description
      t.references :created_by, null: false

      t.timestamps
    end
  end
end
