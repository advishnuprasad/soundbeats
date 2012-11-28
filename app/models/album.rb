class Album < ActiveRecord::Base
  attr_accessible :genre, :name
  validates_presence_of :name

  has_and_belongs_to_many :artists

end
