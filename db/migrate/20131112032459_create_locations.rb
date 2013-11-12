class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :address
      t.string :placename
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
