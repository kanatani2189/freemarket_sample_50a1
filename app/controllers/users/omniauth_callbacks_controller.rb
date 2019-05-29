
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  # SNS認証されたコールバック時の処理
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    user_info = User.find_or_create_from_auth(request.env["omniauth.auth"])
    @user = user_info[:user]
    @snscredential = user_info[:snscredential]
      
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication 
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      render template: 'devise/registrations/new'  
    end
  end


  def failure
    redirect_to root_path and return
  end


end


