class ArtworksController < ApplicationController

  def index
    artworks = Artwork.all
    render json: artworks
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end


  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end



end
