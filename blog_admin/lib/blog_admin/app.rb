require 'sinatra/base'

class BlogAdmin < Sinatra::Base

  set :static, true
  set :public_folder, File.expand_path('..', __FILE__)

  set :views, File.expand_path('../views', __FILE__)

  get '/' do
    send_file File.expand_path('index.html', settings.public_folder)
  end

end
