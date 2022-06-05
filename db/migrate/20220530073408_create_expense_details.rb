class CreateExpenseDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_details do |t|
      t.integer :user_id
      t.integer :expense_id
      t.integer :nature
      t.integer :status
      t.timestamps
    end
  end
end