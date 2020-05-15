class ArtworksController < ApplicationController
  def index
    artworks = Artwork
                .joins(:artist)
                .where(artist_id: params[:user_id])

    shared_artworks = User
                        .select("artworks.*")
                        .joins(:shared_artworks)
                        .where(artwork_shares: {viewer_id: params[:user_id]})
    
    render json: artworks + shared_artworks
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end

  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
