class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, flash: { success: "Category has been successfully created" }
    else
      render "new"
    end
  end

  def destroy
    if @category.delete
      redirect_to admin_categories_path, flash: { danger: "Category has been successfully deleted" }
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
      redirect_to admin_categories_path, flash: { success: "Category has been successfully updated" }
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
