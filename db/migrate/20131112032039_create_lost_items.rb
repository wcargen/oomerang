class CreateLostItems < ActiveRecord::Migration
  def change
    create_table :lost_items do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :category_id
      t.string :item_color
      t.text :item_details
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
