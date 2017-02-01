require './app'

use Rack::Cors do
  allow do
    origins *
    resource '/*/',
        :methods => [:get, :post, :put, :patch, :options],
        :headers => :any
  end
end

run Sinatra::Application

