class PostsController < ApplicationController
  before_action :require_author, only: %i[edit update]
  
  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      render :show
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_sub_post_url(@post.sub_id)
    end
  end

  def edit

  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end
