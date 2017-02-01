class Logger
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /log/
      if req.options?
       [200]
      else
        [200, {"Content-Type" => "text/html"}, ["Logged the thing."]]
      end
    else
      [404, {"Content-Type" => "text/html"}, ["Try logging a thing."]]
    end
  end
end

use Rack::Cors do
  allow do
    origins *
    resource '/*/',
        :methods => [:get, :post, :put, :patch, :options],
        :headers => :any
  end
end

run Logger.new

