class Computer < ActiveRecord::Base
  attr_accessible :name
  
  has_and_belongs_to_many :disks
  has_and_belongs_to_many :grades
  has_and_belongs_to_many :processors
  has_and_belongs_to_many :rams
end
