# frozen_string_literal: true

class CreateAlbum < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.belongs_to :created_by
      t.timestamps
    end
  end
end
