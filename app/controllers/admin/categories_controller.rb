class Admin::CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category has been successfully created"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def index
    @categories = Category.all
  end 

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
