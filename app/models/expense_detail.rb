class ExpenseDetail < ApplicationRecord
  belongs_to :user
  belongs_to :expense

  enum nature: [:Borrow, :Lend]
  enum status: [:Pending, :Completed]
end
