class Computer < ActiveRecord::Base
  
  has_and_belongs_to_many :disks
  has_and_belongs_to_many :grades
  has_and_belongs_to_many :processors
  has_and_belongs_to_many :rams
  has_many :quotes
  has_many :prices
  
  named_scope :laptops, :conditions => {:laptop => true}

  def to_s
    name
  end
end
