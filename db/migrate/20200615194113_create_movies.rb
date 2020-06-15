class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :plot_keywords
      t.string :year
      t.integer :facebook_likes

      t.timestamps
    end
  end
end
