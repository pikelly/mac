class Quote < ActiveRecord::Base
  attr_accessible :computer, :disk, :ram, :grade, :box, :cable, :adapter, :media, :manual, :mouse, :keyboard
end
