class CreateAttachmentRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :attachment_relations do |t|
      t.belongs_to :attachment
      t.references :attachable, polymorphic: true
    end
  end
end
