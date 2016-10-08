class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

    @sub = Sub.find_by_id(params[:sub_id])
    @subs = Sub.all

  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id


    if @post.save
      redirect_to sub_url(params[:sub_id])
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_url(@post.sub)
    else
      render :edit
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    current_sub = @post.sub

    @post.delete
    redirect_to sub_url(current_sub)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end
end
