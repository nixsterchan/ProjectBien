class User < ApplicationRecord

    has_many :reviews
    has_many :comments
    has_many :bookmarks

    has_secure_password 

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    # add in vanity url
    def to_param
        # to overwrite the default
        # we want the username instead of the ID
        username
    end

end
