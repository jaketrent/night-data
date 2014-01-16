class ApplicationController < ActionController::API
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
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

  def cors_preflight_check
    if request.method == :options
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
      render :text => '', :content_type => 'text/plain'
    end
  end
end
