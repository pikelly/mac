class AddPositionToModels < ActiveRecord::Migration
  def self.up
    add_column :computers,  :position, :integer
    add_column :processors, :position, :integer
    add_column :disks,      :position, :integer
    add_column :rams,       :position, :integer
  end

  def self.down
    remove_column :computers,  :position, :integer
    remove_column :processors, :position, :integer
    remove_column :disks,      :position, :integer
    remove_column :rams,       :position, :integer
  end
end
