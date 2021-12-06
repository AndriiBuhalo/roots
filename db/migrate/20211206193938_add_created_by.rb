# frozen_string_literal: true

class AddCreatedBy < ActiveRecord::Migration[6.1]
  def change
    add_reference :attachments, :created_by
    add_reference :albums, :created_by
  end
end
