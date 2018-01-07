class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      session[:user_id] = user.id
      sign_in_and_redirect user, notice: "Signed in!"
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  private
   def omni_helper
     user = User.from_omniauth(request.env["omniauth.auth"])
     if user.provider == "facebook"
       return "Google"
     elsif user.provider == "google_oauth2"
       return "Facebook"
     elsif user.provider == "twitter"
     return "twitter"
     end
   end

end
