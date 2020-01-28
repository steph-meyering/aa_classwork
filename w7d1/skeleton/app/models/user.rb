class User < ApplicationRecord
    after_initialize :ensure_session_token  #:password=()

    validates :user_name, :pw_digest, :session_token, presence: true
    validates :user_name, :session_token, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    attr_reader :password

    def self.find_by_credentials(user_name, password)
        user = User.find_by(
            user: { user_name: params[:user_name] }
        )
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
    end

    def password=(password)
        @password = password
        self.pw_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.pw_digest).is_password?(password)
    end
end
