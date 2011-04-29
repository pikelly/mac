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
    return computer.e if grade.name == "Grade E"
    
    pp = ProcessorPrice.find_by_processor_id_and_computer_id(@processor.id, @computer.id).value || 0
    rp = RamPrice.find_by_ram_id_and_computer_id(@ram.id, @computer.id).value || 0
    dp = DiskPrice.find_by_disk_id_and_computer_id(@disk.id, @computer.id).value || 0
    price = pp + rp + dp
    
    price  = price - (price * eval("computer.#{grade.name.match(/(.)$/)[1].downcase}").to_i)/100 
    price
  end
end
