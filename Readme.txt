# sinatra-iphone-views

Detects an iPhone/iPod browser and renders templates in views/iphone automatically.

Why is that cool? Because iPhone-enabled routes look exactly like any other route. Like so:

get '/test' do
  haml :test
end

The above will render views/iphone/test.haml from an iPhone, and views/test.haml
from anywhere else.

Now why that is NOT cool? Because it relies on disabling template caching, and will
have a performance impact that may or may not be acceptable for your application. Quite
frankly, I haven't benchmarked any differences, but I'm inclined to believe it's
not significant not even to a medium sized app.

# Installation

Make sure you got http://gemcutter.org in your gem sources. Then simply

$ sudo gem install sinatra-iphone-views

# Specs

Just run

$ spec spec/iphone_views_spec.rb

