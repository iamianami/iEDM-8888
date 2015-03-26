class VideoComment < ActiveRecord::Base
  belongs_to :creator,class_name:'User',foreign_key:'user_id'
  belongs_to :video_post
  belongs_to :user

  validates_presence_of :body,:message => '留言不能為空白'
end