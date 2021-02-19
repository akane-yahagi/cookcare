class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # 第 1 引数 => model名 :user (必須)
    # 第 2 引数 => column名 :name (必須)
    # 第 3 引数 => オプション full: true (任意)
    autocomplete :ingredient, :name, full: true # 追加
    
    before_action :current_user
    
    add_flash_types :success, :info, :warning, :danger
    
    helper_method :current_user, :logged_in?
    
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
