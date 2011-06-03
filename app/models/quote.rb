class Quote < ActiveRecord::Base
  #attr_accessible :computer, :disk, :ram, :grade, :box, :cable, :adapter, :media, :manual, :mouse, :keyboard

  attr_accessor :stage

  belongs_to :computer
  belongs_to :disk
  belongs_to :ram
  belongs_to :grade
  belongs_to :processor
  
  validates_presence_of :computer, :if => Proc.new {|q| ["details"].include? q.stage}
  validates_presence_of :disk, :message => "selection is required", :if => Proc.new {|q| ["details", "location", "payment"].include? q.stage}
  validates_presence_of :ram, :grade, :processor, :if => Proc.new {|q| ["details", "location", "payment"].include? q.stage}
  
  validates_format_of :name,     :with => /^[\s\w]+$/,       :message => "- Please enter your name.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :houseid,  :with => /^[\s\w\d]+$/,  :message => "- Please enter the name or number of your house.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :road,     :with => /^[\s\w]+$/,       :message => "- Please enter the name of your road.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :city,     :with => /^[\s\w]+$/,       :message => "- Please enter the name of your town or city.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :postcode, :with => /^[\d\w\s]+$/,   :message => "- Please enter a valid postcode.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :phone,    :with => /^[\d\(\)\s\+]+$/,  :message => "- Please enter a valid telephone number.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :serialno, :with => /^[\w\d\s]+$/,   :message => "- Please enter the serial number as seen in the Apple syeatem profiler.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  validates_format_of :email,    :with => /^[\w\d\.@]+$/,   :message => "- Please enter a valid email address.", :if => Proc.new{|q| ["location", "payment"].include? q.stage}
  
  validates_numericality_of :confirmation, :message => "is required", :equal_to => 1, :if => Proc.new{|q| ["payment"].include? q.stage}
  validates_numericality_of :iagree,       :message => "is required", :equal_to => 1, :if => Proc.new{|q| ["payment"].include? q.stage}
  
  def calculate
    return false unless valid?
    return computer.e if grade.name == "Grade E"
    
    pp = ProcessorPrice.find_by_processor_id_and_computer_id(@processor.id, @computer.id).value || 0
    rp = RamPrice.find_by_ram_id_and_computer_id(@ram.id, @computer.id).value || 0
    dp = DiskPrice.find_by_disk_id_and_computer_id(@disk.id, @computer.id).value || 0
    price = pp + rp + dp
    
    price  = price - (price * eval("computer.#{grade.name.match(/(.)$/)[1].downcase}").to_i)/100 + (box? ? 5 : 0)
    if price > computer.pot.limit
      "capped"
    else
    "#{price}.00"
    end
  end

  private
  def validate
    return true if stage != "payment"
    if collection_date > 2.weeks.from_now
          self.errors.add_to_base "Your collection date is more than two weeks away."
      return false
    elsif collection_date < Time.now
      self.errors.add_to_base "Your collection date is in the past."
      return false
    end
    true
  end
end
