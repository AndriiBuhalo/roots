# frozen_string_literal: true

class AddCreatedByToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :created_by
  end
end
