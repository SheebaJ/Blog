class Article < ApplicationRecord
    belongs_to :category
    # belongs_to :user
    validates_presence_of :title,:body,:category_id,:publish_date,:feature_image_url
    validate :article_published
    
    # def end_date_after_start_date
    #     return if end_date.blank? || start_date.blank?
    
    #     if end_date < start_date
    #       errors.add(:end_date, "must be after the start date")
    #     end
    #  end
    
    def article_published
        if publish_date > 1.month.from_now
			errors.add(:publish_date,"date greater than a month")
		end
    end
end
