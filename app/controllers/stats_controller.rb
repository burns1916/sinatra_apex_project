class StatsController < ApplicationController

    get '/stats' do
        @stats = Stats.all
        erb :"/stats/index"
    end

    get "/stats/:id/new" do 
        @legend_id = params[:id]
        erb :"stats/new"
    end

    post '/stats' do
        binding.pry
        @stat = Stat.create(params)
        redirect to "stats/#{@stat.id}/show"
    end

    get "stats/:id/show" do
        erb :"stats/show"
    end
end