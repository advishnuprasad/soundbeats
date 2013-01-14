class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :roll_no
      t.string :level
      t.string :address

      t.timestamps
    end
  end
end
