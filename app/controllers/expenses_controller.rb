class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

end
