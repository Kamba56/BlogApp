class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  private

  def post_counter
    user.increment!(:posts_counter)
  end
end
