# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
