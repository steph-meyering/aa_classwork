# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :string           not null
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User 

  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub
end
