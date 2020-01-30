# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  details    :text
#  visibility :string           not null
#  finished   :boolean          not null
#  cheers     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :goal do
    title { "MyString" }
    details { "MyText" }
    visibility { "MyString" }
    finished { false }
    cheers { 1 }
    author_id { 1 }
  end
end
