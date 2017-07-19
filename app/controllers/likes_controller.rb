class LikesController < ApplicationController
  def create
    @like = Like.new(likeable_id: likes_params, likeable_type: "Post", user_id: 1)
    if @like.save
      like_count = Post.find(likes_params).likes.count
      render json: {like_count: like_count}.to_json
    else 
      "yikes"
    end
   
  end

  private

  def likes_params
    params.require(:post_id)
  end

end
