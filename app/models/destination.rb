class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_posts
        self.posts.map do |post|
            post
        end
    end

    def most_liked_post
        self.posts.max_by do |post|
            post.likes
        end
    end

    def average_age
        if self.bloggers.count != 0
            sum = 0 
            self.bloggers.each do |blogger|
                sum += blogger.age 
            end
            avg = sum / self.bloggers.count
        end
    end

end
