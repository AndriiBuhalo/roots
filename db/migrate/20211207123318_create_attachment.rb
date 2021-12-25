# frozen_string_literal: true

class CreateAttachment < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :original_filename
      t.string :file
      t.string :keywords
      t.text :notes
      t.string :place
      t.datetime :date
      t.references :created_by
      t.timestamps
    end
  end
end
