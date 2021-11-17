class AddColumnsToAttachements < ActiveRecord::Migration[6.1]
  def change
    add_column :attachments, :keywords, :string
    add_column :attachments, :notes, :string
    add_column :attachments, :place, :string
    add_column :attachments, :date_accuracy, :string
    add_column :attachments, :file_date, :datetime
    add_column :attachments, :downloaded, :string
  end
end
