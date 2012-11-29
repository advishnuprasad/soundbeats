class Album < ActiveRecord::Base
  attr_accessible :genre, :name, :cover

  has_attached_file :cover, :styles => { :small => "64x64>", :medium => "128x128>", :large => "256x256>" }
  has_and_belongs_to_many :artists

  validates_presence_of :name

  def self.build(params)
  end

end
