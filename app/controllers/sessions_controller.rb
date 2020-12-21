class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email_params)
    
    if user && user.authenticate(params[:session][:password])
      
      log_in(user)
      redirect_to recipes_url, success: 'ログインに成功しました'
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def email_params
    params.require(:session).permit(:email)
  end
  
  def password_params
    params.require(:session).permit(:password)
  end

end
