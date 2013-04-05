class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name

  validates_presence_of :user, :name , :description

end
