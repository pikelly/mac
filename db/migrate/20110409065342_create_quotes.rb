class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.references :computer
      t.references :disk
      t.references :ram
      t.references :grade
      t.references :processor
      t.boolean :box
      t.boolean :cable
      t.boolean :adapter
      t.boolean :media
      t.boolean :manual
      t.boolean :mouse
      t.boolean :keyboard
      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
