class StaticController < ApplicationController
  def dashboard
    @data_you_owe = current_user.list_of_expenses_and_users(0) 
    @data_you_owed = current_user.list_of_expenses_and_users(1) 
  end

  def person
  end

  def add_expense
  end
end
