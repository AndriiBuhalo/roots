# frozen_string_literal: true

class RemoveColumnFromAttachments < ActiveRecord::Migration[6.1]
  def change
    remove_column :attachments, :title
    remove_column :attachments, :created_at
    remove_column :attachments, :updated_at
    remove_column :attachments, :date_accuracy
  end
end
