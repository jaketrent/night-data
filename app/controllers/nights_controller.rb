class NightsController < ApplicationController
  def index
    render json: Night.all
  end
end
