require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  test "director has a name and age" do
    # director = Director.create!(name: "Bong Joon-ho", age: 50)
    director = create(:director, name: "Bong Joon-ho", age: 50)

    assert_equal "Bong Joon-ho", director.name
    assert_equal 50, director.age
    assert_equal 0, director.movies.count

    # shovel another movie onto director
    # movie = Movie.new(title: "Snowpiercer", facebook_likes: 70, plot_keywords: "snow|train|", year: 2013)
    # director.movies << [movie]
    # assert_equal 1, director.movies.count
    movies = create_list(:movie, 3, director: director)
    assert_equal 3, director.movies.count
  end
end
