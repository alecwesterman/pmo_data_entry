class TqaAspectsController < ApplicationController
  before_action :set_tqa_aspect, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tqa_aspects = TqaAspect.all
    @tqa_categories = TqaCategory.all

    respond_with(@tqa_aspects)
  end

  def show
    respond_with(@tqa_aspect)
  end

  def new
    @tqa_categories = TqaCategory.all
    @tqa_aspect = TqaAspect.new
    respond_with(@tqa_aspect)
  end

  def edit
    @tqa_categories = TqaCategory.all
  end

  def create
    @tqa_categories = TqaCategory.all
    @tqa_aspect = TqaAspect.new(tqa_aspect_params)
    @tqa_aspect.save
    respond_with(@tqa_aspect)
  end

  def update
    @tqa_categories = TqaCategory.all
    @tqa_aspect.update(tqa_aspect_params)
    respond_with(@tqa_aspect)
  end

  def destroy
    @tqa_aspect.destroy
    respond_with(@tqa_aspect)
  end

  private
    def set_tqa_aspect
      @tqa_aspect = TqaAspect.find(params[:id])
    end

    def tqa_aspect_params
      params.require(:tqa_aspect).permit(:name, :percent_run, :percent_pass, :tqa_category_id)
    end
end
