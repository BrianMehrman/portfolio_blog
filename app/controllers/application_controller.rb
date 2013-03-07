class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :sign_user_in, :sign_user_out, :logged_in?,:current_user

   # user filters
  def sign_user_in(user)
    session[:user_id] = user.id
  end

  def sign_user_out
    session[:user_id] = nil
  end

  def signed_in?
    session[:user_id].present?
  end  

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    else
      nil
    end
  end

  def stringToImage(img_str, temp_name = "temp_image", temp_type="jpg")
    decoded_file = Base64.decode64(img_str)
    file = Tempfile.new([temp_name,".#{temp_type}"])
    file.binmode
    file.write decoded_file
    file
  end

  def require_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to landing_path, :notice => "You must be logged in to see this page."
    end
  end
end
