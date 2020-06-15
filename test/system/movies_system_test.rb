require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase 
    test "visiting the page" do 
        visit 'movies/1'
        assert_text "Parasite"
        assert_text "Bong Joon-Ho"
    end

    test "visiting the show page for another movie" do
        visit '/movies/2'
    
        assert_text "Titanic"
        assert_text "James Cameron"
      end
end

