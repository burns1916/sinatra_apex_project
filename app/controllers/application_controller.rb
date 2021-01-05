require './config/environment'
require './app/models/user'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :"index"
    #Home page of Apex Stat Tracker
  end

  helpers do
    
    def logged_in?
      !!current_user 
      #checks to see if session hash is occupied
    end


    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      #defines user vie session hash
    end
  end

end