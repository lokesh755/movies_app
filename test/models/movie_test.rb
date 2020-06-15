require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
    assert_equal movie.title, "Parasite"
    assert_equal movie.director, "Bong Joon-ho"
  end

  test "movie is not valid without a title" do
    movie = Movie.new(title: "")
    assert_equal false, movie.valid?
  end

  test "validate the release year of movie 'Not Cool'" do
    movie = Movie.new(title: "Not Cool", year: 2014)
    movie.save
    year = Movie.releaseYear("Not Cool")
    assert_equal "2014", year[0]
  end
end