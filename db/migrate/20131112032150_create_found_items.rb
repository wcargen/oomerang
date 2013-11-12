class CreateFoundItems < ActiveRecord::Migration
  def change
    create_table :found_items do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :category_id
      t.string :item_color
      t.text :item_details
      t.date :date
      t.time :time
      t.text :secret_info

      t.timestamps
    end
  end
end
