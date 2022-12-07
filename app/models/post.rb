class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :post_counter

  validates :title, presence: true, length: { in: 0..250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def post_counter
    user.increment!(:posts_counter)
  end
end
