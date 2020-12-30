require 'pry'
class LegendsController < ApplicationController

    get '/legends' do
        @legends = Legends.all
        erb :"/legends/index"
    end

    get '/legends/new' do
        @legends =~ ["Bloodhound", "Gibraltor", "Pathfinder", "Lifeline", "Wraith", "Caustic", "Bangalore", "Mirage", "Octane", "Wattson", "Rampart", "Crypto", "Loba", "Revenant", "Horizon"]
        erb :'legends/new'
    end

    post '/legends' do
        binding.pry
        @legend = Legend.create(:name => params[:legend][:name])
        redirect to "stats/new"
    end

end