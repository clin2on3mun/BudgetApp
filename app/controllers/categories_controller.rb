class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:payments).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'created category'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
