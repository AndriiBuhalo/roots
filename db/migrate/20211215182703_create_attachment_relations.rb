# frozen_string_literal: true

# rubocop:disable Rails/CreateTableWithTimestamps
class CreateAttachmentRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :attachment_relations do |t|
      t.references :attachment
      t.references :attachable, polymorphic: true
    end
    add_index :attachment_relations, %i[attachment_id attachable_id attachable_type], unique: true, name: 'unique_index_of_attachment_relations'
  end
end
# rubocop:enable Rails/CreateTableWithTimestamps
