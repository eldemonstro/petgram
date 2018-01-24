class Post < ApplicationRecord
  after_save :create_hashtags

  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts

  validates :text, presence: true

  def text_with_links
    HashtagService.new(self).generate_text_with_links
  end

  private

  def create_hashtags
    HashtagService.new(self).create_hashtags
  end
end
