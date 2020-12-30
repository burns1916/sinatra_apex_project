class StatsController < ApplicationController

    get '/stats' do
        @stats = Stats.all
        erb :"/stats/index"
    end

    get '/stats/new' do 
        erb :"stats/new"
    end

end