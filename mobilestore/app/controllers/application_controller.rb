class ApplicationController < ActionController::Base
  protect_from_forgery

  def ensure_customer
    unless current_user && current_user.admin == 'customer'
      render :text => "<center><br/><br/><br/><br/><br/>
<h1>Only registered customer can do shopping.</h1><br/>
<p>Store staff are not allowed!</p>
<br/><br/>
<p>If you wish to create a customer login, you need to sign out first.</p>
<a href='/index'>Back to Home Page</a>
</center>", :status => :unauthorized
    end
  end

  def ensure_staff
    unless (current_user && current_user.admin == 'worker') or (current_user && current_user.admin == 'manager')
      render :text => "<center><br/><br/><br/><br/><br/>
<h1>You don't have access here.</h1><br/>
<p><a href='/index'>Back to Home Page</a></p>
<br/><br/></center>", :status => :unauthorized
    end
  end

  def ensure_manager
    unless current_user && current_user.admin == 'manager'
      render :text => "<center><br/><br/><br/><br/><br/>
<h1>Only admin can operate this function.</h1><br/>
<p><a href='/index'>Back to Home Page</a></p>
<br/><br/></center>", :status => :unauthorized
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.admin == 'customer'
      "/items"
    else
      "/orders"
    end
  end

  # before_filter :authenticate_user!
  # user_signed_in?
  # current_user

  # before_filter :ensure_staff
  # before_filter :ensure_manager
  # if current_user.admin == 'manager'

end
