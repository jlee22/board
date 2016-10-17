class Game < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :name
  belongs_to :user
end
