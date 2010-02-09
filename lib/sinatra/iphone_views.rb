module Sinatra
  module IPhoneViews
    def self.registered(app)
      app.enable :reload_templates
      app.set :original_views, Sinatra::Application.views
      app.set :iphone_views, File.join(Sinatra::Application.views, 'iphone')
      app.before do
        # http://lachstock.com.au/code/mobile-pages-in-sinatra/
        iphone = [/AppleWebKit.*Mobile/, /Android.*AppleWebKit/].any? { |r| request.env['HTTP_USER_AGENT'] =~ r }
        options.views = iphone ? Sinatra::Application.iphone_views : Sinatra::Application.original_views
      end
    end
  end
  register IPhoneViews
end

