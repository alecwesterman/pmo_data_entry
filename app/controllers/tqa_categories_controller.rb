class TqaCategoriesController < ApplicationController
  before_action :set_tqa_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tqa_categories = TqaCategory.all
    respond_with(@tqa_categories)
  end

  def show
    respond_with(@tqa_category)
  end

  def new
    @tqa_category = TqaCategory.new
    respond_with(@tqa_category)
  end

  def edit
  end

  def create
    @tqa_category = TqaCategory.new(tqa_category_params)
    @tqa_category.save
    redirect_to(tqa_categories_path)
  end

  def update
    @tqa_category.update(tqa_category_params)
    redirect_to(tqa_categories_path)
  end

  def destroy
    @tqa_category.destroy
    respond_with(@tqa_category)
  end

  private
    def set_tqa_category
      @tqa_category = TqaCategory.find(params[:id])
    end

    def tqa_category_params
      params.require(:tqa_category).permit(:name)
    end
end
