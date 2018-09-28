module UsersHelper
  def choose_new_user_or_edit_user
    if action_name == 'new' || action_name == 'confirm'
      confirm_users_path
    elsif action_name == 'edit'
      user_path(@user.id)
    end
  end
end
