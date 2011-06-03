class AddComputerToPots < ActiveRecord::Migration
  def self.up
    add_column :pots, :computer_id, :integer

    Pot.delete_all
  end

  def self.down
    remove_column :pots, :computer_id

    Pot.delete_all
  end
end
