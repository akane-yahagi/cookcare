class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to sessions_new_path, success: "登録完了"
    else
      flash[:danger] = "登録失敗"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :password_confirmation)
  end
end
