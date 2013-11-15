class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.string :username

      t.timestamps
    end
  end
end
