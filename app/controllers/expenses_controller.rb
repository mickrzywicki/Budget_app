class ExpensesController < ApplicationController
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    @expenses = Expense.page(params[:page]).order(sort_column => sort_direction)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      flash[:success] = t(:'flash.controller.good_create')
      redirect_to expenses_path
    else
      flash.now[:danger] = t(:'flash.controller.bad_create')
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      flash[:success] = t(:'flash.controller.good_update')
      redirect_to expenses_path
    else
      flash.now[:danger] = t(:'flash.controller.bad_update')
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:success] = t('flash.controller.good_delete')
    redirect_to expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :price, :paid_on)
  end

  def sort_column
    Expense.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
