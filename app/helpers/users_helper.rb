module UsersHelper
  def user_display_name(user)
    user.present? ? user.email : "Guest"
  end
end
