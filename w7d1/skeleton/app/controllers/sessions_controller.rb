class SessionsController < ApplicationController

    def new
        render new_user_url
    end

    def create
        @user = User.find_by(users: {user_name: params[:user_name]})
        if @user && @user.is_password?(user_params)
            @user.reset_session_token!
            redirect_to :cats_url
        end
    end

    private
    def user_params
        params.require(:user).permits(:pw_digest)
    end
    
end
