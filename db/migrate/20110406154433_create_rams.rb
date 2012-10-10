class CreateRams < ActiveRecord::Migration
  def self.up
    create_table :rams do |t|
      t.string :name
      t.integer :size
      t.timestamps
    end
    create_table :computers_rams, :id => false  do |t|
      t.references :computer
      t.references :ram
    end
    
    #for capacity in ['512MB', '1GB', '2GB', '3GB', '4GB'] do
    #  Ram.create :name => capacity, :size => capacity.to_i
    #end


  end

  def self.down
    drop_table :computers_rams
    drop_table :rams
  end
end
