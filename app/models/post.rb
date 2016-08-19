class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction)}
  validate :not_clickbait

  def not_clickbait
    unless title.present? && title.match(/Won't\sBelieve|Secret|Top \d/)
      errors.add(:title)
    end
  end
end
