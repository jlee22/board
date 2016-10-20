class Game < ActiveRecord::Base
  # Remember to create a migration!
  validates_presence_of :name

  belongs_to :host, class_name: 'User'
  has_and_belongs_to_many :players, class_name: 'User'
  before_create :add_host_to_players

  def add_host_to_players
    players << host
  end
end
