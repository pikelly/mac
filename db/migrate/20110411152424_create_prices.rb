class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.references :computer
      t.references :processor
      t.references :disk
      t.references :ram
      t.references :grade
      
      t.integer :value
      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
