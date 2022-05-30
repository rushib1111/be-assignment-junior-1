class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|
      t.integer :user_id
      t.integer :friend_id
      t.timestamps
    end

    add_index :relations, :user_id
    add_index :relations, :friend_id
  end
end
