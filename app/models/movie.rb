class Movie < ApplicationRecord
    validates :title, presence: true
    belongs_to :director

    def self.movieTitles
        self.pluck(:title)
    end

    def self.moviesByFacebookLikes
        self.order("facebook_likes DESC")
    end

    def self.releaseYear(title)
        self.where("title = ?", title).pluck(:year)
    end

    def self.movieCountWithMinFacebookLikes(number)
        self.where("facebook_likes > ?", number).count
    end

    def self.bestFoulPlayMovieByDirector(directorName)
        self.where('plot_keywords like \'%Foul%\' ').joins(:director).where(directors: {name: directorName}).order('facebook_likes DESC').limit(1).pluck(:title)[0]
    end
end
