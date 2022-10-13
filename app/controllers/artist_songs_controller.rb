class ArtistSongsController < ApplicationController
  def index
    #artist isn't an instance variable because don't need to access elsewhere
    @artist = Artist.find(params[:artist_id])
    @songs = @artist.songs
  end
end
