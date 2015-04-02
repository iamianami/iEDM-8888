class VideoPost < ActiveRecord::Base
  include AutoHtml

  belongs_to :creator,class_name: 'User',foreign_key: 'user_id'
  has_many :video_comments
  has_many :video_post_categories
  has_many :categories, through: :video_post_categories

  validates_presence_of :title,message: '標題不能為空白'
  validates_presence_of :url,message: '網址不能為空白'

  auto_html_for :url do
    html_escape
    image
    soundcloud(:width => 350, :height => 208, :autoplay => false)
    youtube(:width => 350, :height => 200, :autoplay => false)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def previous
    VideoPost.where(["id < ?", id]).last
  end

  def next
    VideoPost.where(["id > ?", id]).first
  end

  def average_rating
      return 0 if self.video_comments.size == 0
      self.video_comments.sum(:rating) / self.video_comments.size 
  end
end