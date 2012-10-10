class CreateComputers < ActiveRecord::Migration
  def self.up
    create_table :computers do |t|
      t.string :name
      t.boolean :laptop

      t.timestamps
    end

    #['MacBook White', 'MacBook Black', 'MacBook Unibody LED', 'MacBook Pro 15" Non Unibody', 'MacBook Pro 17" Non Unibody',
    # 'MacBook Pro 13 Unibody', 'MacBook Pro 15" Unibody', 'MacBook Pro 17 Unibody', 'MacBook Air 13.3"','iBook G4 12',
    # 'iBook G4 14', 'PowerBook G4 12', 'PowerBook G4 15', 'PowerBook G4 17'].each do |mac|
    #   Computer.create :name => mac, :laptop => true
    #end
         
  end

  def self.down
    drop_table :computers
  end
end
