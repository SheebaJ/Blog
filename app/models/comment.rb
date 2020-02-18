class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user
    validates_presence_of :body,:article_id,:user_id,:title
    end
