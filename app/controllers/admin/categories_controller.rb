class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category has been successfully created"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def destroy
    if @category.delete
      flash[:danger] = "Category has been successfully deleted"
      redirect_to admin_categories_path
    end  
  end

  def edit
  end

  def index
    @categories = Category.all
  end 

  def new
    @category = Category.new
  end

  def show
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category has been successfully updated"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
