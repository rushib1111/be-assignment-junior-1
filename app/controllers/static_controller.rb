class StaticController < ApplicationController
  def dashboard
    @data_you_owe = current_user.list_of_expenses_and_users(0) 
    @data_you_owed = current_user.list_of_expenses_and_users(1) 
  end

  def person
  end

  def add_expense
    users = params[:users].compact
    expense = Expense.create(paid_by: current_user.id,  description: params[:description], amount: params[:amount])
    users << current_user.name
    users.each do |user|
      u = User.find_by(name: user)
      if u.present?
        nature = "Borrow"
        nature = "Lend" if u.name == params[:paid_by]
        ExpenseDetail.create(user_id: u.id, expense_id: expense.id, nature: nature)
      end
    end
  end
end
