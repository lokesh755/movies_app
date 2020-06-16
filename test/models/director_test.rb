require 'test_helper'

class DirectorTest < ActiveSupport::TestCase
  test "director has a name and age" do
    director = Director.create!(name: "Bong Joon-ho", age: 50)

    assert_equal "Bong Joon-ho", director.name
    assert_equal 50, director.age
  end
end