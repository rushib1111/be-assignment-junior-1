class Expense < ApplicationRecord
  has_many :expense_details, :dependent => :destroy
  has_many :users, :through => :expense_details
end
