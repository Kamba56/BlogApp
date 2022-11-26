class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  private

  def likes_counter
    post.increment!(:likes_counter)
  end
end
