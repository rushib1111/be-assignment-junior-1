class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :user_id
      t.decimal :amount
      t.integer :paid_by
      t.string :description
      t.decimal :individual_amount
      t.timestamps
    end

    add_index :expenses, :user_id
  end
end