class Pot < ActiveRecord::Base
  belongs_to :computer
  validates_numericality_of :value, :limit, :remainder
  validates_presence_of :computer_id
  validates_uniqueness_of :computer_id, :message => "already has a pot"

end
