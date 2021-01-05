require 'pry'
class LegendsController < ApplicationController

    get '/legends' do
        if logged_in?
            @users = current_user
            @legends = Legend.all
        erb :"/legends/legends"
        else
            redirect to "/login"
        end
        #route which loads all legends with stat in the database for particular user
    end

    get '/legends/new' do
        if logged_in?
            @user = current_user
        erb :"legends/new"
        else
            redirect to "/login"
        end
        #route to create new legend
    end

    post '/legends' do
        if @legend = Legend.find_by(:name => params[:name]) && Legend.find_by(:user_id => current_user.id)
            redirect to "stats/#{@legend.id}/edit"
        else
            @legend = Legend.new(params)
            @legend.user_id = current_user.id
            @legend.save
            redirect to "stats/#{@legend.id}/new"
        end
        #route which post new legend to database
    end

end