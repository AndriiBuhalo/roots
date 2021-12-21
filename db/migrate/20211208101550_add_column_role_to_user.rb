# class AddColumnRoleToUser
# frozen_string_literal: true

class AddColumnRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
