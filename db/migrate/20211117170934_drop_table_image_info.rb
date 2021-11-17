class DropTableImageInfo < ActiveRecord::Migration[6.1]
  def change
    drop_table :image_infos
  end
end
