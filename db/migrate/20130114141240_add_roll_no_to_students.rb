class AddRollNoToStudents < ActiveRecord::Migration
  def change
    add_column :students, :roll_no, :integer
  end
end
