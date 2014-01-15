class ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end

  def show
    render json: Activity.find(params[:id])
  end
end
