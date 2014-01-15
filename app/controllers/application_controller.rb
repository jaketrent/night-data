class ApplicationController < ActionController::API
  before_filter :set_access

  def set_access
    response.headers["Access-Control-Allow-Origin"] = "http://localhost:3000 http://localhost:5000"
    response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    response.headers['Access-Control-Request-Method'] = '*'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
