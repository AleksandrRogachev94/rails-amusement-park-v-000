module UsersHelper

  def user_type
    if current_user.admin?
      "ADMIN"
    else
      "NORMAL USER"
    end
  end
end
