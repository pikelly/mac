class Quote < ActiveRecord::Base
  attr_accessible :computer, :disk, :ram, :grade, :box, :cable, :adapter, :media, :manual, :mouse, :keyboard
  
  belongs_to :computer
  belongs_to :disk
  belongs_to :ram
  belongs_to :grade
  belongs_to :processor
end
