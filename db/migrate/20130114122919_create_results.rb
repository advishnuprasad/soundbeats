class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :student_id
      t.string :subject
      t.string :grade

      t.timestamps
    end
  end
end
