class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :details
      t.date :date
      t.time :time
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
