class Disk < ActiveRecord::Base
  attr_accessible :name, :speed
  
  has_and_belongs_to_many :computers
  has_many :quotes
  has_many :prices

  acts_as_list
  default_scope :order => "position"

  def <=> other
    self.name <=> other.name
  end

  def to_s
    name.to_s
  end
end
