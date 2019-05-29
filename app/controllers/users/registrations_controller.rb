class Users::RegistrationsController < Devise::RegistrationsController

  def create
    if params[:snscredential]
      pass =   Devise.friendly_token.first(6)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
      super
      sns = SnsCredential.find(params[:snscredential])
      sns[:user_id] = @user.id
      sns.save
    else
      super  
    end
  end
end
