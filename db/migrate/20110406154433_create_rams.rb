class CreateRams < ActiveRecord::Migration
  def self.up
    create_table :rams do |t|
      t.string :name
      t.integer :size
      t.timestamps
    end
  end

  def self.down
    drop_table :rams
  end
end
