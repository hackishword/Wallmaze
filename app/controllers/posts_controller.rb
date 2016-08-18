class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
    respond_to do |format|
      format.html
      format.js { return "alert('rock!')" }
    end
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post  = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created! Please check the form."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js 
      end
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to post_path @post
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post successfully deleted"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    if Post.find(params[:id]).user.try(:id) != current_user.id
      flash[:error] = "You do not have permission to do that."
      redirect_to root_path
    end
  end

end
