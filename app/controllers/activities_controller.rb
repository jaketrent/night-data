class ActivitiesController < ApplicationController
  def index
    render json: Activity.all.order(:description)
  end

  def show
    render json: Activity.find(params[:id])
  end

  def create
    activity = Activity.new(filter_params)
    activity.save()
    render json: activity
  end

  def update
    activity = Activity.find(params[:id])
    activity.update(filter_params)
    render json: activity
  end

  def destroy
    activity = Activity.find(params[:id])
    render json: activity.destroy()
  end

  private

  def filter_params
    params.require(:activity).permit :description
  end

end
