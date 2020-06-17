require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "movie is valid with a title" do
    movie = create(:movie, title: "Parasite", director: create(:director, name: "Bong Joon-ho"))

    assert_equal movie.title, "Parasite"
    assert_equal movie.director.name, "Bong Joon-ho"
  end

  test "movie is not valid without a title" do
    movie = build(:movie, title: "")
    assert_equal false, movie.valid?
  end
end