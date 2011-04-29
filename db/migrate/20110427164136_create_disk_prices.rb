class CreateDiskPrices < ActiveRecord::Migration
  def self.up
    # This is a bitch as we are migrating from a habtm to a :through relationship
    create_table :disk_prices do |t|
      t.references :computer
      t.references :disk
      t.integer :value
    end
    for computer in Computer.all
      for disk in computer.old_disks
        DiskPrice.create :computer_id => computer.id, :disk_id => disk.id, :value => 0
      end
    end
  end

  def self.down
    drop_table :disk_prices
  end
end
