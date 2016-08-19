module RelationshipsHelper

  def follow_button_text(user)
    if current_user.following.include?(user)
      "Unfollow"
    else
      "Follow"
    end
  end

  def follow_link_path(user)
    if current_user.following.include?(user)
      unfollow_user_path(user.user_name)
    else
      follow_user_path(user.user_name)
    end
  end

  def follow_or_unfollow(user)
    if current_user.following.include?(user)
      "unfollow"
    else
      "follow"
    end
  end
end
