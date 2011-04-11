class Processor < ActiveRecord::Base
  attr_accessible :name, :speed
  
  has_and_belongs_to_many :computers
  has_many :quotes
  
    
  def <=> other
    self.name <=> other.name
  end

  def to_s
    name.to_s
  end
end
