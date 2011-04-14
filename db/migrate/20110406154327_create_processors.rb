class CreateProcessors < ActiveRecord::Migration
  def self.up
    create_table :processors do |t|
      t.string :name
      t.integer :speed
      t.timestamps
    end
    create_table :computers_processors, :id => false do |t|
      t.references :computer
      t.references :processor
    end
    ['1.83GHz Core Duo', '2.16GHz Core Duo', '2GHz Core Duo', '2.1GHz Core Duo','2.2Ghz Core Duo', '2.23GHz Core Duo','2.4GHz Core Duo'].each do |p|
      Processor.create :name => p
    end
  end

  def self.down
    drop_table :computers_processors
    drop_table :processors
  end
end
