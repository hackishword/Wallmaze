module ApplicationHelper

  def alert_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'default-avatar.jpg', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end

  def notifier(notification)
    commenter = User.find(notification.notified_by_id)
    commenter.user_name
  end

  def notification_past(notification)
    if notification.notice_type == "comment"
      "commented on"
    else
      "liked"
    end
  end
end
