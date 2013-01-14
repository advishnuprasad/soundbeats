class Student < ActiveRecord::Base
  set_primary_key :roll_no
  attr_accessible :name , :roll_no, :level
  has_many :results 
end
