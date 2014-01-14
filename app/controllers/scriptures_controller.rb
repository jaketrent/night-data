class ScripturesController < ApplicationController
  def index
    render json: Scripture.all
  end
end