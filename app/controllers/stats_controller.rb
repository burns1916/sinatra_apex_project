class StatsController < ApplicationController

    get "/stats/:id/new" do 
        @legend = Legend.find_by_id(params[:id])
        erb :"stats/new"
        #route to add stats to selected legend
    end

    post '/stats/:id' do
        @stat = Stat.new(params)
        @stat.legend_id = params[:id]
        @stat.user_id = current_user.id
        @stat.save
        redirect to "stats/#{@stat.id}"
        #posts inputed stats to database
    end

    get "/stats/:id" do
        @stat = Stat.find_by_id(params[:id])
        @legend = Legend.find_by_id(params[:id])
        erb :"stats/show"
        #shows stats for particular legend
    end

    get "/stats/:id/edit" do
        @stat = Stat.find_by_id(params[:id])
        @legend = Legend.find_by_id(params[:id])
        if logged_in? && @stat.user_id == current_user.id
            erb :"/stats/edit"
        else
            redirect to "/login"
        end
        #loads requested legend stats for editting
    end

    patch "/stats/:id" do
        @stat = Stat.find_by_id(params[:id])
        if logged_in? && !params[:kills].blank? && !params[:wins].blank? && @stat.user_id == current_user.id
            @stat.update(kills: params[:kills], wins: params[:wins]) 
            redirect to "/stats/#{@stat.id}"
        else
            redirect to "/stats/#{@stat.id}/edit"
        end
        #posts editted stats for legend
    end

    delete "/stats/:id/delete" do
        @stat = Stat.find_by_id(params[:id])
        @legend = Legend.find_by_id(params[:id])
        if logged_in? && @stat.user_id == current_user.id
            @stat.delete
            @legend.delete
            redirect to "/legends"
        else
            redirect to "/login"
        end
        #deletes legend from database
    end
end