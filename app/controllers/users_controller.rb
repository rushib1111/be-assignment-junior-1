class UsersController < ApplicationController
  def friend_expenses
    @friend = User.find_by(id: params[:id])
    @expenses = Expense.includes(:expense_details).where(expense_details: {user_id: [current_user.id, @friend.id]})
  end
end
