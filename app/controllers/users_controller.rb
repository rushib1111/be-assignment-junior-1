class UsersController < ApplicationController
  def my_expenses
    @friend = User.find_by(id: current_user.id)
    @expenses = current_user.expenses
  end
end
