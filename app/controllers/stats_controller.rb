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
        redirect to "stats/#{@stat.id}/show"
    end

    get "/stats/:id/show" do
        @stat = Stat.find_by_id(params[:id])
        @legend = Legend.find_by_id(@stat.legend_id)
        erb :"stats/show"
    end
end