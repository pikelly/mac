class Computer < ActiveRecord::Base
  
  has_one :pot, :dependent => :destroy

  #has_and_belongs_to_many :disks
  has_and_belongs_to_many :grades
  has_and_belongs_to_many :old_processors, :class_name => "Processor"
  has_and_belongs_to_many :old_rams,       :class_name => "Ram"
  has_and_belongs_to_many :old_disks,      :class_name => "Disk"
  has_many :quotes

  has_many :prices
  has_many :processor_prices, :dependent => :destroy
  has_many :processors, :through => :processor_prices
  accepts_nested_attributes_for :processor_prices
  
  has_many :ram_prices
  has_many :rams, :through => :ram_prices, :dependent => :destroy
  accepts_nested_attributes_for :ram_prices

  has_many :disk_prices
  has_many :disks, :through => :disk_prices, :dependent => :destroy
  accepts_nested_attributes_for :disk_prices

  default_scope :order => "position"
  acts_as_list

  named_scope :laptops, :conditions => {:laptop => true}

  before_validation :strip_name

  def to_s
    name
  end
  
  def image_name
    name.gsub(/"/, "inch")
  end

  private
  def strip_name
    self.name.strip!
  end
end
