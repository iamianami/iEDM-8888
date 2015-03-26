module Likeable
  
  extend ActiveSupport::Concern

  included do
    has_many :likes ,as: :likeable
  end

  def like
    self.likes.where(like: true).size
  end

  def dislike
   self.likes.where(like: false).size
  end

end