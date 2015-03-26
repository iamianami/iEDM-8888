class Post < ActiveRecord::Base
  include Likeable
  include Sluggable



  belongs_to :creator,class_name:'User',foreign_key:'user_id'
  has_many :comments,:dependent => :destroy
  has_many :post_categories
  has_many :categories,through: :post_categories

  validates_uniqueness_of :creator,scope: :collect

  validates :description,presence: true
  validates_presence_of :title, :message => "標題不能為空白"



  def previous
    Post.where(["id < ?", id]).last
  end

  def next
    Post.where(["id > ?", id]).first
  end

  def admin?
    self.role == 'admin'
  end
end