class Result < ActiveRecord::Base
  attr_accessible :grade, :student_id, :subject
  belongs_to :student , :foreign_key => "roll_no"
end
