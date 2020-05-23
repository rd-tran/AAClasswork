class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def redirect_to_root
    redirect_to root_url if logged_in?
  end

  def require_moderator
    sub = Sub.find(params[:id])

    if current_user.id != sub.moderator_id
      flash[:errors] = ['Must be moderator to edit subreddit']
      redirect_to root_url
    end
  end

  def require_author
    @post = Post.find(params[:id])

    if current_user.id != post.author_id
      flash[:errors] = ['Must be author to edit post']
      redirect_to post_url(@post)
    end
  end
end
