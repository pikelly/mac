class Quote < ActiveRecord::Base
  #attr_accessible :computer, :disk, :ram, :grade, :box, :cable, :adapter, :media, :manual, :mouse, :keyboard
  
  belongs_to :computer
  belongs_to :disk
  belongs_to :ram
  belongs_to :grade
  belongs_to :processor
  
  validates_presence_of :computer, :disk, :ram, :grade, :processor

  def calculate
    return false unless valid?
    
    Price.find_by_computer_id_and_disk_id_and_ram_id_and_grade_id(computer, disk, ram, grade).value
  end
end
