class Price < ActiveRecord::Base
  #attr_accessible :computer, :disk, :ram, :grade

  belongs_to :computer
  belongs_to :processor
  belongs_to :disk
  belongs_to :ram
  belongs_to :grade
end
