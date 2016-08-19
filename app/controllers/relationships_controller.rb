class RelationshipsController < ApplicationController

  before_action :set_relationship_other

  def unfollow_user
    current_user.unfollow(@other_user.id)
    flash[:alert] ||= ""
    flash[:alert] += "You unfollowed @#{@other_user.user_name}!"
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def follow_user
    current_user.follow(@other_user.id)
    flash[:notice] ||= ""
    flash[:notice] += "You followed @#{@other_user.user_name}!"
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def set_relationship_other
    @other_user = User.find_by(user_name: params[:user_name])
  end
end
