class Bookmark < ApplicationRecord
  
  belongs_to :review
  belongs_to :user

  # making unique per user per review
  # scope of this review should be unique to each user, makes sure theres only one review per user
  validates :review, uniqueness: { scope: :user }


end
