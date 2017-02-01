require 'sinatra'
require 'sinatra/cross_origin'

set :allow_origin, :any
set :allow_methods, [:get, :post, :options]
set :expose_headers, ['Content-Type']

get '/' do
  'This is a logger bridge app. GET /log for details.'
end

get '/log' do
 'This app accepts POST requests to /log from client-side apps. Try it!'
end

options '/log' do
 cross_origin

 # Works around a bug in OPTIONS handling with sinatra/cross-origin
 response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
 response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

 200
end

post '/log' do
 cross_origin
 request.params.console_log.each do |param|
   logger.info(param)
 end
end
