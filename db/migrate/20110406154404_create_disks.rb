class CreateDisks < ActiveRecord::Migration
  def self.up
    create_table :disks do |t|
      t.string :name
      t.integer :size
      t.timestamps
    end
    
    create_table :computers_disks, :id => false  do |t|
      t.references :computer
      t.references :disk
    end
    #for capacity in ['60GB', '80GB','100GB', '120GB', '160GB', '250GB', '500GB'] do
    #  Disk.create :name => capacity, :size => capacity.to_i
    #end

  end

  def self.down
    drop_table :computers_disks
    drop_table :disks
  end
end
