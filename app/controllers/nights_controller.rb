class NightsController < ApplicationController
  def index
    render json: Night.all
  end

  def show
    render json: Night.find(params[:id])
  end

  def create
    night = Night.new(filter_params)
    night.save()
    render json: night
  end

  def update
    night = Night.find(params[:id])
    night.update(filter_params)
    render json: night
  end

  private

  def filter_params
    params.require(:night).permit :subject, :songs, :scriptures, :activities
  end

end
