class SessionsController < Devise::SessionsController
#after_sign_in_path_for is called by devise
#  def after_sign_in_path_for(user)
#    if current_user.admin == 'customer'
#      "/items"
#    else
#      "/myprofile"
#    end
#  end
end