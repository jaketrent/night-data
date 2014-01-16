class ApplicationController < ActionController::API
  after_filter :add_cors_headers

  def check_preflight
    if request.method == :options
      render :text => '', :content_type => 'text/plain'
    end
  end

  private

  def add_cors_headers
    allowed_domains = %w(http://localhost:5000 http://localhost:3000 http://thisisthenight.herokuapp.com)
    reqOrigin = request.headers['HTTP_ORIGIN']
    if allowed_domains.include? reqOrigin
      response.headers["Access-Control-Allow-Origin"] = reqOrigin
      response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, PATCH, DELETE, GET, OPTIONS'
      response.headers['Access-Control-Request-Method'] = '*'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      response.headers['Access-Control-Allow-Credentials'] = 'true'
      logger.debug "#{reqOrigin} added to CORS response header"
    else
      logger.debug "#{reqOrigin} not in an allowed domain"
    end
  end

end
