class Role < ApplicationRecord
    has_many :permissions
    has_many :users, through: :permissions 
 
    validates_presence_of :title
    validates_uniqueness_of :title

end
