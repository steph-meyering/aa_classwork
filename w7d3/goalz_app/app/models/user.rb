# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#  cheers          :integer          not null
#

class User < ApplicationRecord

    attr_reader :password
    validates :username, :password_digest, presence: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(user_params)
        user && user.is_password?(password) ? user : nil
    end
    
    def password=(password)
        password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.session_token.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
