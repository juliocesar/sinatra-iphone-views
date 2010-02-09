gem 'sinatra',  '1.0.a';  require 'sinatra'
gem 'haml',     '2.2.17'; require 'haml'
# require 'ruby-debug'

require File.join(File.dirname(__FILE__), *%w(.. lib sinatra iphone_views))

get '/test' do
  haml :test
end
