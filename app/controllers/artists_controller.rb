class ArtistsController < ApplicationController
    def index 
        @artists = Artist.all.order("created_at ASC")
    end

    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs
    end

    def new
        @artist = Artist.new
    end

    def create
        Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img))
        redirect_to artists_path
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        artist = Artist.find(params[:id])
        artist.update(params.require(:artist).permit(:name, :albums, :hometown, :img))
        redirect_to artists_path
    end

    def destroy
        Artist.find(params[:id]).destroy
        redirect_to artists_path
    end

end
