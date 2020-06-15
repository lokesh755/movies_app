require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase 
    test "visiting the page" do 
        visit 'movies/1'
        assert_text "Parasite"
        assert_text "Bong Joon-Ho"
    end
end

