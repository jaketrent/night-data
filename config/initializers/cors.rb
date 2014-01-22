#require 'logger'

class Cors

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call env

    puts 'headers'
    puts headers

    cors_headers = gen_cors_headers env
    headers = headers.merge(cors_headers)

    [status, headers, body]
  end

  private

  def gen_cors_headers env
    cors_headers = {}
    allowed_domains = %w(http://localhost:5000 http://localhost:3000 http://thisisthenight.herokuapp.com)

    #reqOrigin = request.headers['HTTP_ORIGIN']
    reqOrigin = env['HTTP_ORIGIN']

    puts 'reqOrigin'
    puts reqOrigin

    if allowed_domains.include? reqOrigin
      cors_headers["Access-Control-Allow-Origin"] = reqOrigin
      cors_headers['Access-Control-Allow-Methods'] = 'POST, PUT, PATCH, DELETE, GET, OPTIONS'
      cors_headers['Access-Control-Request-Method'] = '*'
      cors_headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
      cors_headers['Access-Control-Allow-Credentials'] = 'true'
      #logger.debug "#{reqOrigin} added to CORS response header"
    #else
      #logger.debug "#{reqOrigin} not in an allowed domain"
    end

    cors_headers
  end

end