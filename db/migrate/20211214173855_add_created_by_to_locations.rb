class AddCreatedByToLocations < ActiveRecord::Migration[6.1]
  def change
    add_reference :locations, :created_by
  end
end
