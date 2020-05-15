class LikesController < ApplicationController
  def index
    if params.has_key?(:comment_id)
      likes = Like
              .where(likeable_id: params[:comment_id])
              .where(likeable_type: :Comment)   
    elsif params.has_key?(:artwork_id)
      likes = Like
              .where(likeable_id: params[:artwork_id])
              .where(likeable_type: :Artwork)
    elsif params.has_key?(:user_id) && params.has_key?(:type)
      likes = Like
              .where(user_id: params[:user_id])
              .where("likeable_type ILIKE ?", "#{params[:type]}")
    end
    
    if params.has_key?(:user_id) && likes.first.nil?
      render json: {query_string: :invalid}, status: :not_found
    else
      render json: likes
    end

  end
end
