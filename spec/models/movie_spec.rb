require 'rails_helper'

RSpec.describe Movie, type: :model do
  let!(:studio_1) { Studio.create!(name: 'Universal Studios', location: 'Hollywood') }
  let!(:studio_2) { Studio.create!(name: 'Disney Studios', location: 'Orlando') }
  let!(:studio_3) { Studio.create!(name: 'Sony Studios', location: 'Culver City') }
  
  let!(:movie_1) { studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') }
  let!(:movie_2) { studio_2.movies.create!(title: 'Iron Man', creation_year: 2008, genre: 'Superhero') }
  let!(:movie_3) { studio_2.movies.create!(title: 'Wall-e', creation_year: 2007, genre: 'Animated') }

  let!(:actor_1) { movie_1.actors.create!(name: 'Harrison Ford', age: 78) }
  let!(:actor_2) { movie_1.actors.create!(name: 'John Rhys-Davies', age: 60) }
  let!(:actor_3) { movie_2.actors.create!(name: 'Gwyneth Paltrow', age: 49) }

  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'instance methods' do
    describe '#average_actor_age' do
      it 'returns the average actor age' do
        expect(movie_1.average_actor_age).to eq(69)
      end
    end
  end
end
