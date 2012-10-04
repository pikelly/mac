class CreatePots < ActiveRecord::Migration
  def self.up
    create_table :pots do |t|
      t.integer :value
      t.integer :cap
      t.integer :remainder
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pots
  end
end
