class StatsController < ApplicationController

    get '/stats' do
        @stats = Stats.all
        erb :"/stats/index"
    end

    get "/stats/:id/new" do 
        @legend = Legend.find_by_id(params[:id])
        erb :"stats/new"
    end

    post '/stats/:id' do
        @stat = Stat.new(params)
        @stat.legend_id = params[:id]
        @stat.user_id = current_user.id
        @stat.save
        redirect to "stats/#{@stat.id}"
    end

    get "/stats/:id" do
        @stat = Stat.find_by_id(params[:id])
        @legend = Legend.find_by_id(@stat.legend_id)
        erb :"stats/show"
    end

    get "/stats/:id/edit" do
        @stat = Stat.find_by_id(params[:id])
        if logged_in? && @stat.user_id == current_user.id
            erb :"/stats/edit"
        else
            redirect to "/login"
        end
    end

    patch "/stats/:id" do
        @stat = Stat.find_by_id(params[:id])
        if logged_in? && !params[:content].blank? && @stat.user_id == current_user.id
            @stat.update(kills: params[:kills], wins: params[:wins]) 
            @stat.save
            redirect to "/stats/#{@stat.id}"
        else
            redirect to "/stats/#{@stat.id}/edit"
        end
    end

    delete "/stats/:id/delete" do
        @stat = Stat.find_by_id(params[:id])
        if logged_in? && @stat.user_id == current_user.id
            @stat.delete
            redirect to "/legends"
        else
            redirect to "/login"
        end
    end
end