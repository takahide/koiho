module ApplicationHelper
  def admin_controller? c
    return true if c == "posts" || c == "comments"
    return false
  end
end
