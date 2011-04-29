class AddGradeToComputer < ActiveRecord::Migration
  def self.up
    add_column :computers, :a, :string, :default => "-0%"
    add_column :computers, :b, :string
    add_column :computers, :c, :string
    add_column :computers, :d, :string
    add_column :computers, :e, :string
  end

  def self.down
    remove_column :computers, :a
    remove_column :computers, :b
    remove_column :computers, :c
    remove_column :computers, :d
    remove_column :computers, :e
  end
end
