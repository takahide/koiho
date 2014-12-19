module ApplicationHelper
  def admin_controller? c
    return true if c == "posts" || c == "videos" || c == "comments"
    return false
  end
end
