class HashtagService
  include ActionView::Helpers::UrlHelper
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def create_hashtags
    hashtags = post.text.scan(/#\S+/).map { |ht| ht.tr('#', '') }
    hashtags.each do |ht|
      hashtag = Hashtag.find_or_create_by(name: ht)
      HashtagPost.find_or_create_by(hashtag: hashtag, post: post)
    end
  end

  def generate_text_with_links
    generated_text = post.text.split(' ').map do |split|
      if split.starts_with?('#')
        hashtag = Hashtag.find_by(name: split.tr('#', ''))
        split = link_to split, hashtag_path(hashtag.id)
      end
      split
    end
    generated_text.join(' ')
  end

  def hashtag_path(id)
    Rails.application.routes.url_helpers.hashtag_path(id)
  end
end
