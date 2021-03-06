class SongsController < ApplicationController

  def index
    render json: Song.all.order(:title)
  end

  def show
    render json: Song.find(params[:id])
  end

  def create
    song = Song.new(filter_params)
    song.save()
    render json: song
  end

  def update
    song = Song.find(params[:id])
    song.update(filter_params)
    render json: song
  end

  def destroy
    song = Song.find(params[:id])
    render json: song.destroy()
  end

  private

  def filter_params
    params.require(:song).permit :number, :title
  end

end
