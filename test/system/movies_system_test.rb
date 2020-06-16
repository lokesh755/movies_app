require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show page" do
    attributes = { title: "Parasite", director: "Bong Joon-ho" }
    movie = Movie.create(attributes)

    # As a user,
    # When I visit /movies/1
    visit "/movies/#{movie.id}"

    # I see the title of the movie "Parasite"
    assert_text "Parasite"
    # I also see the name of the director "Bong Joon-ho"
    assert_text "Bong Joon-ho"
  end

  test "visiting the show page for another movie" do
    attributes = { title: "Titanic", director: "James Cameron" }
    movie = Movie.create(attributes)

    visit "/movies/#{movie.id}"

    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "visiting the index page" do
    attributes = { title: "Titanic", director: "James Cameron" }
    movie = Movie.create(attributes)

    attributes = { title: "Parasite", director: "Bong Joon-ho" }
    movie = Movie.create(attributes)

    visit "/movies/"

    assert_text "Titanic"
    assert_text "Parasite"
  end

end