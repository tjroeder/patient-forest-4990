require 'rails_helper'

RSpec.describe '/movies/show.html.erb' do
  let!(:studio_1) { Studio.create!(name: 'Universal Studios', location: 'Hollywood') }
  let!(:studio_2) { Studio.create!(name: 'Disney Studios', location: 'Orlando') }
  let!(:studio_3) { Studio.create!(name: 'Sony Studios', location: 'Culver City') }
  
  let!(:movie_1) { studio_1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') }
  let!(:movie_2) { studio_2.movies.create!(title: 'Iron Man', creation_year: 2008, genre: 'Superhero') }
  let!(:movie_3) { studio_2.movies.create!(title: 'Wall-e', creation_year: 2007, genre: 'Animated') }

  let!(:actor_1) { movie_1.actors.create!(name: 'Harrison Ford', age: 78) }
  let!(:actor_2) { movie_1.actors.create!(name: 'John Rhys-Davies', age: 60) }
  let!(:actor_3) { movie_2.actors.create!(name: 'Gwyneth Paltrow', age: 49) }

  describe 'as a user' do
    describe 'when they visit the page' do
      it 'should visit the show page' do
        visit "/movies/#{movie_1.id}"

        expect(page).to have_current_path("/movies/#{movie_1.id}")
      end
      
      it 'should display the movies title, creation year, and genre' do
        visit "/movies/#{movie_1.id}"
        save_and_open_page
        expect(page).to have_content(movie_1.title)  
        expect(page).to have_content(movie_1.creation_year)  
        expect(page).to have_content(movie_1.genre)  
      end
      
      it 'should display the actors name and age for movie' do
        visit "/movies/#{movie_1.id}"

        expect(page).to have_content(actor_1.name)  
        expect(page).to have_content(actor_2.name)  
        expect(page).to have_content(actor_1.age)  
        expect(page).to have_content(actor_2.age)  
        expect(page).to have_no_content(actor_3.name)  
        expect(page).to have_no_content(actor_3.age)  
      end

      it 'should display the actors average age for the movie' do
        visit "/movies/#{movie_1.id}"
        
        expected = "Average Actor Age: #{movie_1.average_actor_age}"
        expect(page).to have_content(expected)
      end
    end
    
    describe 'when they fill in add actor form' do
      it 'should add a already created actor to the movie' do
        visit "/movies/#{movie_1.id}"
        fill_in :name, with: 'Gwyneth Paltrow'
        click_button 'Save'

        expect(page).to have_content(actor_3.name)
      end
    end
  end
end