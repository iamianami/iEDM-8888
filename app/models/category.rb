class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts,through: :post_categories
  has_many :video_post_categories
  has_many :video_posts,through: :video_post_categories

  before_create :generate_slug

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.created_at
  end
end