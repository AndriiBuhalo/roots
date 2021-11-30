# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :file
      t.string :keyword
      t.string :notes
      t.string :place
      t.datetime :date
      t.bigint :author_id
      t.index ['author_id'], name: 'index_attachments_on_author_id'
    end
  end
end
