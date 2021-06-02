class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t(:'flash.controller.good_create')
      redirect_to expenses_path
    else
      flash[:danger] = t(:'flash.controller.bad_create')
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
