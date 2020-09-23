class Blogger < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :age, numericality: {greater_than: 0}
    validates :bio, presence: true, length: {minimum: 30}

    has_many :posts
    has_many :destinations, through: :posts

    def most_liked_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def top_destinations
        counts = Hash.new 0

        self.posts.each do |post|
            counts[post.title] += 1
        end

        counts = counts.sort_by { |title, count| count}
        top_5 = counts.max_by(5) do |title, count|
            count
        end
        x = top_5.map do |array|
            array[0]
        end
    end
end
