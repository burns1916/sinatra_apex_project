class StatsController < ApplicationController

    get '/stats' do
        @stats = Stats.all
        erb :"/stats/index"
    end

    get '/stats/new' do
        @legends = Legend.all
        erb :"/stats/new"
    end

    post '/stats' do
        @stat = Stat.create(:wins => params[:wins], :kills => params[:kills])

        legend_selection = params[:stat][:legends]
        legend_selection.each do |legend|
            @stat.legends << Legends.find(legend)
        end

        @stat.save
    end



end