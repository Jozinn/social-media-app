class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :likes

    def likes
        likes = Like.where(post_id: self.id)
        return likes.length
    end

    def comments
        comments = Comment.where(post_id: self.id)
        return likes.length
    end
end
