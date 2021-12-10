require 'rails_helper'

RSpec.describe '/studio/index.html.erb' do
  let!(:studio_1) { Studio.create!(name: 'Universal Studios', location: 'Hollywood') }
  let!(:studio_2) { Studio.create!(name: 'Disney Studios', location: 'Orlando') }
  let!(:studio_3) { Studio.create!(name: 'Sony Studios', location: 'Culver City') }
  
  let!(:movie_1) { studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') }
  let!(:movie_2) { studio_1.movies.create!(title: 'Iron Man', creation_year: 2008, genre: 'Superhero') }
  let!(:movie_3) { studio_1.movies.create!(title: 'Wall-e', creation_year: 2007, genre: 'Animated') }

  describe 'as a user' do
    describe 'when they visit the page' do
      it 'should visit the studios index' do
        visit '/studios'

        expect(page).to have_current_path('/studios')
      end

      it 'displays the studio name and location' do
        visit '/studios'

        within("#studio-#{studio_1.id}") do
          expect(page).to have_content(studio_1.name)
          expect(page).to have_content(studio_1.location)
        end

        within("#studio-#{studio_2.id}") do
          expect(page).to have_content(studio_2.name)
          expect(page).to have_content(studio_2.location)
        end

        within("#studio-#{studio_3.id}") do
          expect(page).to have_content(studio_3.name)
          expect(page).to have_content(studio_3.location)
        end
      end

      it 'displays the studios movie titles beneath the movies' do

      end
    end
  end
end