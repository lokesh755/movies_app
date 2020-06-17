class Movie < ApplicationRecord
    validates :title, presence: true
    belongs_to :director

    def self.movie_titles
        self.pluck(:title)
    end

    def self.movies_by_facebook_likes
        self.order("facebook_likes DESC")
    end

    def self.movie_count_with_min_facebook_likes(number)
        self.where("facebook_likes > ?", number).count
    end

    scope :release_year, -> (year) { where(year: "#{year}") }

    scope :likes_desc, ->() { order(facebook_likes: :desc) }

    scope :by_director, ->(director_name) { joins(:director).where(directors: { name: director_name }) }

    scope :with_plot_keyword, ->(plot_keyword) { where("plot_keywords LIKE ?", "%#{plot_keyword}%") }

    def self.most_liked_by_director_name_and_plot(director_name, plot_keyword)
        likes_desc().
        by_director(director_name).
        with_plot_keyword(plot_keyword).
        first
    end
end
