class Comment < ApplicationRecord

  belongs_to :review

  # just a validation to say we want something in the body just to know we do not want empty comments
  validates :body, presence: true
  
end
