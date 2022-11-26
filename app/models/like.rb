class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :likes_counter

  private

  def likes_counter
    post.increment!(:likes_counter)
  end
end
