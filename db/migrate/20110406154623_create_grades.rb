class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.string :name
      t.integer :value
      t.timestamps
    end
    create_table :computers_grades, :id => false  do |t|
      t.references :computer
      t.references :grade
    end

    value = 0
    #for grade in ["Grade A", "Grade B", "Grade C", "Grade D", "Grade E"]
    #  Grade.create :name => grade, :value => value
    #  value += 1
    #end

  end

  def self.down
    drop_table :computers_grades
    drop_table :grades
  end
end
