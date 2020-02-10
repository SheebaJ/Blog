class User < ApplicationRecord
    has_many :permissions
    has_many :roles, through: :permissions

    validates_presence_of :username, :dob

end
