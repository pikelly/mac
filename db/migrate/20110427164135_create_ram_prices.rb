class CreateRamPrices < ActiveRecord::Migration
  def self.up
    # This is a bitch as we are migrating from a habtm to a :through relationship
    create_table :ram_prices do |t|
      t.references :computer
      t.references :ram
      t.integer :value
    end
    for computer in Computer.all
      for ram in computer.old_rams
        RamPrice.create :computer_id => computer.id, :ram_id => ram.id, :value => 0
      end
    end
  end

  def self.down
    drop_table :ram_prices
  end
end
