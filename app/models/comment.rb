class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  private

  def comment_counter
    post.increment!(:comments_counter)
  end
end
