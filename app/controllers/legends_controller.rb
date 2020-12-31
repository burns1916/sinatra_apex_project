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
    end

    get '/legends/new' do
        if logged_in?
            @user = current_user
        erb :"legends/new"
        else
            redirect to "/login"
        end
    end

    post '/legends' do
        @legend = Legend.new(params)
        @legend.user_id = current_user.id
        @legend.save
        binding.pry
        redirect to "stats/#{@legend.id}/new"
    end

end