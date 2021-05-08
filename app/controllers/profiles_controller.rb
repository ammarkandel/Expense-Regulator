class ProfilesController < ApplicationController
  def home; end

  def members
    @members = User.all
    @members_expenses = Expense.where(user_id: current_user).total_amount
  end
end
