class ApplicationController < ActionController::Base
    before_action :find_current_user
    
    def find_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorized
        if !find_current_user 
            redirect_to new_user_path
        end
    end

    def admin_authorized
        if !find_current_user.is_admin 
            redirect_to unauthorized_path
        end
    end
end
