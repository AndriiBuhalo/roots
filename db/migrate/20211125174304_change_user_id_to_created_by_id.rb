class ChangeUserIdToCreatedById < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :user_id, :created_by_id
  end
end
