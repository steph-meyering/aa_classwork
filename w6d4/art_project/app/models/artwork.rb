# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string
#  image_url  :text
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

end
