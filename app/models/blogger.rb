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
end
