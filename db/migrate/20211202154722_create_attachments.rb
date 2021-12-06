# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :file
      t.string :keywords
      t.string :notes
      t.string :place
      t.datetime :date
    end
  end
end
