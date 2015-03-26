class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :video_posts
  has_many :video_comments


 

 

  has_secure_password 

  before_create :generate_slug
  
  validates_presence_of :username,message: '會員名稱不得為空白'
  validates_presence_of :gender,message: '你是男生還是女生？'
  validates_presence_of :birthday,message: '生日別忘了告訴我們'
  validates_presence_of :address,message: '住在哪一區要說喔，這樣附近的Party才不會錯過'


  #paperclip
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300#", :thumb => "100x100#" }, 
                    :default_url => "../ILOVEEDM_phixr.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.created_at
  end

  def admin?
    self.role == 'admin'
  end

end