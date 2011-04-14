class Grade < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :computers
  has_many :quotes
  has_many :prices

  def to_s
    name
  end
end
