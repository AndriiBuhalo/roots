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
      t.bigint :created_by_id
      t.index ['created_by_id'], name: 'index_attachments_on_created_by_id'
    end
  end
end
