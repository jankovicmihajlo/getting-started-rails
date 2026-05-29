class CategoriesController < ApplicationController
  allow_unauthenticated_access only: :index
  before_action :set_category, only: %i[  edit update destroy ]
  def index
    @categories = Category.order(:name)
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: t("categories.notices.created")
      @categories = Category.order(:name)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: t("categories.notices.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @category.destroy
    redirect_to categories_path, status: :see_other
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.expect(category: [ :name ])
  end
end
