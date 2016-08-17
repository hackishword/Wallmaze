class ProfilesController < ApplicationController
  def show
    @posts = User.find_by(user_name: params[:user_name]).posts.order('created_at DESC').page params[:page]
    respond_to do |format|
      format.html
      format.js 
    end
  end
end
