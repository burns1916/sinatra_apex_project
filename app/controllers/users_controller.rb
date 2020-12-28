class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"/users/signup"
        else
            redirect to "/legends"
        end
    end

    post '/signup' do
        if params[:username] != "" && params[:password] != ""
            @user = User.create(:username => params[:username], :password => params[:password])
            session[:user_id] = @user.id
            redirect to "/legends"
        else
            redirect to "/signup"
        end
    end

    



end