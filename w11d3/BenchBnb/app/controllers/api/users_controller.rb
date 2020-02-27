class Api::UsersController < ApplicationController

    #SPIRE
    attr_reader :password


    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        @user && @user.password=(password) ? @user : nil
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        
    end

    def reset_session_token!

    end

    def ensure_session_token

    end

end
