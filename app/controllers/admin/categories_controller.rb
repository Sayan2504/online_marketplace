class Admin::CategoriesController < ApplicationController
    def new
        @category = Category.new
    end
end
