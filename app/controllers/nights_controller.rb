class NightsController < ApplicationController
  def index
    render json: Night.all
  end

  def show
    render json: Night.find(params[:id])
  end

  def create
    convert_incoming_params
    night = Night.new(filter_params)
    night.save()
    render json: night
  end

  def update
    night = Night.find(params[:id])
    convert_incoming_params
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
    params.require(:night).permit :subject, song_ids: [], scripture_ids: [], activity_ids: []
  end

end
