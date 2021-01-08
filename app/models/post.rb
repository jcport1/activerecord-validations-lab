class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :title_include 

    CLICKBAIT_PATTERNS = [
        "Won't Believe",
        "Secret",
        "Top[number]",
        "Guess"
    ]

    def title_include
        if title.present? && CLICKBAIT_PATTERNS.none? {|p| title.match(p)} #iterating through Click_bait pattern to find match
            errors.add(:title, "title not clickbait-y enough")
        end
    end
end
