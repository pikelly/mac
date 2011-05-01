class CreateProcessorPrices < ActiveRecord::Migration
  def self.up
    # This is a bitch as we are migrating from a habtm to a :through relationship
    create_table :processor_prices do |t|
      t.references :computer
      t.references :processor
      t.integer :value
    end
    for computer in Computer.all
      for processor in computer.old_processors
        ProcessorPrice.create :computer_id => computer.id, :processor_id => processor.id, :value => 0
      end
    end
  end

  def self.down
    drop_table :processor_prices
  end
end
