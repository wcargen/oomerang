class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :seeker_user_id
      t.integer :finder_user_id
      t.integer :lost_item_id
      t.integer :found_item_id
      t.string :status

      t.timestamps
    end
  end
end
