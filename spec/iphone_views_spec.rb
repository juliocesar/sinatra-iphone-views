require File.join(File.dirname(__FILE__), 'dummy')
gem 'rspec', '1.3.0';     require 'spec'
gem 'rack-test', '0.5.3'; require 'rack/test'
require 'spec/interop/test'

set :environment, :test
set :run, :false
set :logging, false

def app
  @app ||= Sinatra::Application
end

describe 'a Sinatra app' do
  include Rack::Test::Methods
  it 'should render views/iphone/test.haml when an iPhone accesses the page' do
    get '/test', {}, 'HTTP_USER_AGENT' => 'AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C25 Safari/419.3'
    last_response.body.should =~ /In ur iPhone/
  end
  
  it 'should let views/test.haml render normally when NOT accessed from an iPhone' do
    get '/test'
    last_response.body.should =~ /In ur browser/
  end
end

