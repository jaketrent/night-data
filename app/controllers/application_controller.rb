class ApplicationController < ActionController::API
  before_filter :set_access


  def set_access
    allowed_domains = %w(http://localhost:5000 http://localhost:3000 http://thisisthenight.herokuapp.com)
    if allowed_domains.include? request.headers['HTTP_ORIGIN']
      response.headers["Access-Control-Allow-Origin"] = request.headers['HTTP_ORIGIN']
      response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      response.headers['Access-Control-Request-Method'] = '*'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      response.headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
end
