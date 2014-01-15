class NightsController < ApplicationController
  def index
    render json: Night.all
  end

  def show
    render json: Night.find(params[:id])
  end
end
