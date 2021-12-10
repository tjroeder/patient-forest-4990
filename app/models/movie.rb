class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors, through: :movie_actors
end
