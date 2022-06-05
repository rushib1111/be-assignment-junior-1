class ExpensesController < ApplicationController
  def dashboard
    @data_you_owe = current_user.list_of_expenses_and_users(0) 
    @data_you_owed = current_user.list_of_expenses_and_users(1) 
  end

  def add_expense
    users = params[:users].compact
    paid_by = User.find_by(name: params[:paid_by])
    expense = Expense.create(paid_by: paid_by.id,  description: params[:description], amount: params[:amount])
    users << current_user.name
    users_count = 0
    users.each do |user|
      u = User.find_by(name: user)
      if u.present?
        nature = "Borrow"
        nature = "Lend" if u.name == params[:paid_by]
        expense.expense_details.create(user_id: u.id, nature: nature)
        users_count += 1
      end
    end
    individual_amount = (params[:amount].to_i/users_count).round(2) rescue 0
    expense.update(individual_amount: individual_amount)
    redirect_to "/expenses/my_expenses"
  end

  def settle_expense
    detail = ExpenseDetail.joins(:expense).where(expense: {description: params[:expense]}, expense_details: {user_id: current_user.id}).last
    detail.update(status: params[:status]) if detail.present?
    redirect_to "/expenses/my_expenses"
  end
  
  def my_expenses
    @friend = User.find_by(id: current_user.id)
    @expenses = current_user.expenses
  end
end
