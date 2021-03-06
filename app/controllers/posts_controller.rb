class PostsController < ApplicationController
before_action :authenticate_user!
  def index
    @comment = Comment.new
    @posts = Post.all.reverse
    @post = Post.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @comment = Comment.new
    @post = Post.new(post_params)
    @post.user = current_user


    respond_to do |format| 
      if @post.save
      
        format.html {render "_posts_partial", layout: false}
        format.js
        # render json: {new_post: @post }.to_json
        # redirect_to posts_path
      else
        @errors = @post.errors.full_messages
        render 'new'

      end 
    end 
  end 

  def edit
    @post = Post.find(params[:id])
    
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path
    else
      @errors = @post.errors.full_messages
      render 'edit'
    end 

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @project.destroy
    redirect_to posts_path
    
  end

  private

  def post_params
    params.require(:post).permit(:category, :body)
  end
end
