class Movie < ApplicationRecord
    validates :title, presence: true
    belongs_to :director

    def self.movie_titles
        self.pluck(:title)
    end

    def self.movies_by_facebook_likes
        self.order("facebook_likes DESC")
    end

    def self.release_year(title)
        self.where("title = ?", title).pluck(:year)
    end

    def self.movie_count_with_min_facebook_likes(number)
        self.where("facebook_likes > ?", number).count
    end

    def self.best_foul_play_movie_by_director(directorName)
        self.where('plot_keywords like \'%Foul%\' ').joins(:director).where(directors: {name: directorName}).order('facebook_likes DESC').limit(1).pluck(:title)[0]
    end
end
