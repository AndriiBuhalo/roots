# frozen_string_literal: true

class ChangeColumnsAttachments < ActiveRecord::Migration[6.1]
  def change
    rename_column :attachments, :keywords, :keyword
    rename_column :attachments, :file_date, :date
  end
end
