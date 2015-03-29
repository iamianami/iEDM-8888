class Comment < ActiveRecord::Base
  include Likeable

  belongs_to :creator,class_name:'User',foreign_key:'user_id'
  belongs_to :post
  has_many :likes,as: :likeable,:dependent => :destroy

  validates_presence_of :body,:message => '不能留空白留言喔！'

  def admin?
    self.role == 'admin'
  end

  
end