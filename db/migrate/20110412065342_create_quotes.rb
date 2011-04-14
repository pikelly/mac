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
      
      t.text :name, :limit => 128
      t.text :postcode, :limit => 10
      t.text :houseid, :limit => 64
      t.text :phone, :limit => 64
      t.text :road, :limit => 128
      t.text :serialno, :limit => 128
      t.text :city, :limit => 64
      t.text :email, :limit => 128
      t.boolean :packaged
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
