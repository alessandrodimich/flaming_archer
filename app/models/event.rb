class Event < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :title

  validates_presence_of :user_id, :name, :description, :title

end
