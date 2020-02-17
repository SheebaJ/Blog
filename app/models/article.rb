class Article < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments
    # validates_presence_of :title,:body,:category_id,:publish_date,:feature_image_url,:user_id
    validate :article_published?

    extend FriendlyId
    friendly_id :title, use: :slugged

    

    mount_uploader :feature_image_url,FeatureImageUrlUploader 

    def article_published?
        if publish_date > 1.month.from_now
		  errors.add(:publish_date,"date greater than a month")
    #   is_published = true
        end
    end
end
