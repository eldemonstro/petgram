class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Post enviado'
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :name)
  end
end
