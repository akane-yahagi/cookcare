class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    before_action :current_user
    
    add_flash_types :success, :info, :warning, :danger
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def authenticate_user
        if @current_user == nil
            redirect_to root_url, danger: "ログインが必要です"
        end
    end
end
