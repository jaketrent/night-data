class ApplicationController < ActionController::API

  include ActionController::MimeResponds

  respond_to :json

  def check_preflight
    if request.method == :options
      render :text => '', :content_type => 'text/plain'
    end
  end

  private

end
