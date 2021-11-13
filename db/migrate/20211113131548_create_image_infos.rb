class CreateImageInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :image_infos do |t|
      t.string :keywords
      t.string :notes
      t.string :place
      t.string :date_accuracy
      t.datetime :image_date
      t.string :downloaded
      t.belongs_to :attachment
    end
  end
end
