require 'sinatra'
require 'sinatra/cross_origin'

set :allow_origin, :any
set :allow_methods, [:get, :post, :options]
set :expose_headers, ['Content-Type']

get '/' do
  'Hello world!'
end

get '/log' do
 'Try logging a thing'
end

options '/log' do
 cross_origin
 response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
 response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
 200
end

post '/log' do
 cross_origin
 puts req.params
end
