# config.ru
# hangar
#
# Created by Nat Budin on 12/15/10.

class MinimalApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["<h1>Hello, MacRuby!</h1>"]]
  end
end

run MinimalApp.new