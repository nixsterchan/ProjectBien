class Comment < ApplicationRecord

  belongs_to :review
  belongs_to :user


  # just a validation to say we want something in the body just to know we do not want empty comments
  validates :body, presence: true
  
  profanity_filter :body

end
