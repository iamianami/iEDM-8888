class VideoPostCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :video_post
end