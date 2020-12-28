class LegendsController < ApplicationController

    get '/legends' do
        redirect_if_not_logged_in
        @legends = Legends.all
        erb :"/legends/index"
    end

    get '/legends/:slug' do
        redirect_if_not_logged_in
        slug = params[:slug]
        @legend = Legend.find_by_slug(slug)
        erb :"/legends/show"
    end


end