class UsersController < ApplicationController

    get '/:username' do
        if !logged_in?
          redirect '/login'
        end
        slug = params[:username]
        @user = User.find_by_slug(slug)
        if !@user.nil? && @user == current_user
          erb :"users/show"
        else
          redirect "/login"
        end
    end

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

    get '/login' do
        if !logged_in?
            erb :"users/login"
        else
            redirect to "/legends"
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to "/legends"
        else
            redirect to "/signup"
        end
    end

    get '/logout' do
        if !logged_in?
            redirect to "/"
        else
            session.clear
            redirect to "/login"
        end
    end

end