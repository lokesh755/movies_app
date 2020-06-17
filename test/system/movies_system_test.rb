require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show page" do
    director = create(:director, name: "Bong Joon-ho", age: 50)

    movie = create(:movie, { title:"Parasite", director: director })

    # As a user,
    # When I visit /movies/1
    visit "/movies/#{movie.id}"

    # I see the title of the movie "Parasite"
    assert_text "Parasite"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "Bong Joon-ho"
  end

  test "visiting the show page for another movie" do
    
    director = create(:director, name: "James Cameron", age: 50)

    movie = create(:movie, { title:"Titanic", director: director })

    visit "/movies/#{movie.id}"

    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "visiting the index page" do
    director = create(:director, name: "Bong Joon-ho", age: 50)

    movie = create(:movie, { title:"Parasite", director: director })


    director = create(:director, name: "James Cameron", age: 50)

    movie = create(:movie, { title:"Titanic", director: director })

    visit "/movies/"

    assert_text "Titanic"
    assert_text "Parasite"
  end

end