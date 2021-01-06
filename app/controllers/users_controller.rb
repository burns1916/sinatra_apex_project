class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"/users/signup"
        else
            redirect to "/legends"
        end
        #route request for new users to create account
    end

    post '/signup' do
        @user = User.new(:username => params[:username], :password => params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/legends"
        else
            redirect to "/signup"
        end
        #post route when users have filled out registration form
    end

    get '/login' do
        if !logged_in?
            erb :"users/login"
        else
            redirect to "/legends"
        end
        #route request for users to login with an existing account
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/legends"
        else
            redirect to "/signup"
        end
        #post request when users have filled out login form
    end

    get '/logout' do
        if !logged_in?
            redirect to "/"
        else
            session.clear
            redirect to "/login"
        end
        #route request for user to log out of account
    end
end