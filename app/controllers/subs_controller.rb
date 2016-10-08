class SubsController < ApplicationController
  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to subs_url
    else
      render :new
    end
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
  end

  def update
    @sub = Sub.find_by_id(params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to subs_url
    else
      render :edit
    end
  end

  def show
    @sub = Sub.find_by_id(params[:id])
    @posts = @sub.posts
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
