class CreateComputers < ActiveRecord::Migration
  def self.up
    create_table :computers do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :computers
  end
end
