class AttractionsController < ApplicationController

  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :require_authorization!
  after_action :verify_authorized

  def index
    authorize Attraction
    @attractions = Attraction.all
  end

  def show
    authorize @attraction
  end

  def edit
    authorize @attraction
  end

  def update
    authorize @attraction
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), notice: "Successfully updated attraction"
    else
      render 'edit'
    end
  end

  def new
    authorize Attraction
    @attraction = Attraction.new
  end

  def create
    authorize Attraction
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      flash[:notice] = "Successfully created attraction"
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end
  end

  private

    def set_attraction
      @attraction = Attraction.find_by(id: params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
    end
end
