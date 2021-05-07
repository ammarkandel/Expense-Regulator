class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = current_user.expenses
    @user_expenses = Expense.where(user_id: current_user).total_amount
  end

  def destroy
    @expense = Expense.find(params[:id])
    respond_to do |format|
      if @expense.destroy
        format.html { redirect_to expenses_path, notice: 'Expense was deleted successfuly' }
      else
        format.html { render 'index' }
      end
    end
  end

  def new
    @expense = Expense.new
    @current_user_groups = current_user.groups
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'Expense was created successfuly' }
      else
        format.html { render 'new' }
      end
    end
  end

  def ungrouped
    @ungrouped_expenses = current_user.expenses.none_grouped_expenses
    @ungrouped_amount = @ungrouped_expenses.total_amount
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id, group_ids: [])
  end
end
