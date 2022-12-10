class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    like = current_user.likes.new(
      user_id: current_user.id,
      post_id: @post.id
    )

    if like.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", message: 'Successfully liked the post'
    else
      redirect_to "/users/#{@post.user_id}", alert: 'Error has occured'
    end
  end
end
