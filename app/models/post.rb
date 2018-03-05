class Post < ApplicationRecord
  after_save :create_hashtags

  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts

  has_attached_file :photo, styles: { medium: "300x300>" }, 
    default_url: "/images/:style/missing.png"

  validates_attachment :photo,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :photo, attachment_presence: true, presence: true

  def text_with_links
    HashtagService.new(self).generate_text_with_links
  end

  private

  def create_hashtags
    HashtagService.new(self).create_hashtags
  end
end
