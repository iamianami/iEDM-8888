module Sluggable

  extend ActiveSupport::Concern

  included do 
    before_create :generate_slug
    # class_attribute :sluggable_column
  end

  def generate_slug
    self.slug = self.title
  end

  def to_param
    self.slug
  end

  # module Classmethod
  #   def sluggable_column(column_name)
  #     self.slug_column = column_name
  #   end
  # end

end