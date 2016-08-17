class ProfilesController < ApplicationController
  def show
    @user = User.find_by(user_name: params[:user_name])
    @posts = @user.posts.order('created_at DESC').page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
