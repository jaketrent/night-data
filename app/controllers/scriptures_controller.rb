class ScripturesController < ApplicationController
  def index
    render json: Scripture.all
  end

  def show
    render json: Scripture.find(params[:id])
  end
end