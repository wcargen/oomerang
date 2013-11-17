class AddTitle < ActiveRecord::Migration

  def change
    change_table :items do |t|
      t.string :title
    end
  end
end
