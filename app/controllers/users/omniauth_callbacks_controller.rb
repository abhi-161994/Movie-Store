class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      session[:user_id] = user.id
      sign_in_and_redirect user, notice: "Signed in!"
      set_flash_message(:notice, :success, kind: omni_helper) if is_navigational_format?
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url, alert: user.errors.full_messages.join("\n")
    end
  end

  alias_method :facebook, :all
  alias_method :google_oauth2, :all
  alias_method :twitter, :all


    # def facebook
    #   @user = User.from_omniauth(request.env["omniauth.auth"])
      # if @user.persisted?
      #   sign_in_and_redirect @user, event: :authentication
      #   set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      # else
      #   session["devise.facebook_data"] = request.env["omniauth.auth"]
      #   redirect_to new_user_registration_url
      # end
    # end
    # def failure
    #   redirect_to root_path
    # end
    #
    # def google_oauth2
    #     # You need to implement the method below in your model (e.g. app/models/user.rb)
    #     @user = User.from_omniauth(request.env['omniauth.auth'])
    #
    #     if @user.persisted?
    #       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
    #       sign_in_and_redirect @user, event: :authentication
    #     else
    #       session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
    #       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    #     end
    # end

    # private
    #   def message_omniauth
    #     flash[:alert] = "Logged In Successfuly"
    #   end

  private
   def omni_helper
     user = User.from_omniauth(request.env["omniauth.auth"])
     if user.provider == "facebook"
       return "Facebook"
     elsif user.provider == "google_oauth2"
       return "Google"
     elsif user.provider == "twitter"
     return "twitter"
     end
   end

end
