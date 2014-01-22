class ScripturesController < ApplicationController
  def index
    render json: Scripture.all.order(:reference)
  end

  def show
    render json: Scripture.find(params[:id])
  end

  def create
    scripture = Scripture.new(filter_params)
    scripture.save()
    render json: scripture
  end

  def update
    scripture = Scripture.find(params[:id])
    scripture.update(filter_params)
    render json: scripture
  end

  def destroy
    scripture = Scripture.find(params[:id])
    render json: scripture.destroy()
  end

  private

  def filter_params
    params.require(:scripture).permit :reference
  end

end