class AddData < ActiveRecord::Migration
  def self.up
    ['MacBook White', 'MacBook Black', 'MacBook Unibody LED', 'MacBook Pro 15" Non Unibody', 'MacBook Pro 17" Non Unibody',
     'MacBook Pro 13 Unibody', 'MacBook Pro 15" Unibody', 'MacBook Pro 17 Unibody', 'MacBook Air 13.3"', 'iBook G4 12',
     'iBook G4 14', 'PowerBook G4 12', 'PowerBook G4 15', 'PowerBook G4 17'].each do |mac|
      Computer.create :name => mac, :laptop => true
    end

    for capacity in ['60GB', '80GB', '100GB', '120GB', '160GB', '250GB', '500GB'] do
      Disk.create :name => capacity, :size => capacity.to_i
    end

    for capacity in ['512MB', '1GB', '2GB', '3GB', '4GB'] do
      Ram.create :name => capacity, :size => capacity.to_i
    end

    value = 0
    for grade in ["Grade A", "Grade B", "Grade C", "Grade D", "Grade E"]
      Grade.create :name => grade, :value => value
      value += 1
    end

  end

  def self.down
  end
end
