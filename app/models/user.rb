class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :relations, :dependent => :destroy
  has_many :friends, :through => :relations, :source => :user

  has_many :expense_details, :dependent => :destroy
  has_many :expenses, :through => :expense_details


  def list_of_expenses_and_users(transaction_type)
    expense_ids = ExpenseDetail.where(user_id: self.id, nature: transaction_type).pluck(:expense_id)
    lended_users = []
    total_amount = 0
    Expense.where(id: expense_ids).each do |exp|
      total_amount += exp.amount
      lended_users << {users: exp.users.where.not(id: self.id), amount: exp.amount}
    end
    lended_users_hash = {expenses: lended_users, total_amount: total_amount}
  end
end
