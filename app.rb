require 'sinatra'

get '/' do
  'Hello world!'
end

get '/log' do
 'Try logging a thing'
end

options '/log' do
end

post '/log' do
end
