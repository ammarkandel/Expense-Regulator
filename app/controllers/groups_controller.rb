class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def show
    @group_expenses = @group.expenses
    @group_amount = @group_expenses.total_amount
  end

  def destroy
    respond_to do |format|
      if @group.destroy
        format.html { redirect_to groups_path, notice: 'Group was deleted successfuly' }
      else
        format.html { render 'index' }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_path, notice: 'Group was updated successfuly' }
      else
        format.html { render 'edit' }
      end
    end
  end

  def create
    group = current_user.groups.new(group_params)

    respond_to do |format|
      if group.save
        format.html { redirect_to groups_path, notice: 'Group was created successfuly' }
      else
        format.html { render 'new' }
      end
    end
  end

  private

  def set_group
    @group = Group.find_by_id(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
