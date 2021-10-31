class ExpensesController < ApplicationController
  before_action :user_expenses, except: [:destroy]

  def index
    @expenses_amount = @expenses.total_amount
  end

  def destroy
    expense = Expense.find_by_id(params[:id])

    respond_to do |format|
      if expense.destroy
        format.html { redirect_to expenses_path, notice: 'Expense was deleted successfuly' }
      else
        format.html { render 'index' }
      end
    end
  end

  def new
    @expense = Expense.new
    @user_groups = current_user.groups
  end

  def create
    expense = @expenses.new(expense_params)

    respond_to do |format|
      if expense.save
        format.html { redirect_to expenses_path, notice: 'Expense was created successfuly' }
      else
        format.html { render 'new' }
      end
    end
  end

  def ungrouped
    @ungrouped_expenses = @expenses.none_grouped_expenses
    @ungrouped_amount = @ungrouped_expenses.total_amount
  end

  private

  def user_expenses
    @expenses = current_user.expenses
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id, group_ids: [])
  end
end
