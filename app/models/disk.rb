class Disk < ActiveRecord::Base
  attr_accessible :name, :speed
  
  has_and_belongs_to_many :computers
end
