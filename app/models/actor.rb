class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.find_by_name(sel_name)
    find_by(name: sel_name)
  end
end