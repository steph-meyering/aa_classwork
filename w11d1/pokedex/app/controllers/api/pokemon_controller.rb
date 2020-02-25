class Api::PokemonController < ApplicationController

    def index
        @pokemon = Pokemon.all.includes(:items)
        render :index
    end

    def show
        @pokemon = Pokemon.find_by(id: params[:id])
        render :show
    end


end