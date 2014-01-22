class NightsController < ApplicationController

  before_filter :authenticate_user!

  def index
    render json: Night.all.order(:subject)
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

  def destroy
    night = Night.find(params[:id])
    render json: night.destroy()
  end

  private

  def convert_incoming_params
    params[:night][:song_ids] = params[:night][:songs]
    params[:night][:scripture_ids] = params[:night][:scriptures]
    params[:night][:activity_ids] = params[:night][:activities]

    params[:night].delete(:songs)
    params[:night].delete(:scriptures)
    params[:night].delete(:activities)

    params[:night][:song_ids] ||= []
    params[:night][:scripture_ids] ||= []
    params[:night][:activity_ids] ||= []
  end

  def filter_params
    convert_incoming_params
    params.require(:night).permit :subject, song_ids: [], scripture_ids: [], activity_ids: []
  end

end
