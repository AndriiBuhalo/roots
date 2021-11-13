class CreateCreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :file
      t.timestamps
    end
  end
end
