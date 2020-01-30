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

require 'rails_helper'


RSpec.describe User, type: :model do
  subject(:mia) { User.create(username: "Princess Mia", password: "imaprincess")}
  context "receives username and password arguments" do
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  end

  context "find by credentials method returns corresponding user object" do
    expect User.find_by_credentials("Princess Mia", "imaprincess").to eq(:mia)
  end

  context "password_digest is a BCrypt object" do
    

    
  end



  # pending "add some examples to (or delete) #{__FILE__}"
end
