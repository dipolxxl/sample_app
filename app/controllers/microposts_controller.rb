class MicropostsController < ApplicationController
  before_filter :authenticate, only: [:create, :destroy]
  before_filter :authorized_user, only: :destroy

  def index
    if signed_in?
      user = User.find(params[:user_id])
      @feed_items = user.feed.paginate(page: params[:page])
    end
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      flash[:error] = "Micropost can't be blank!"
      redirect_to root_path
    end
  end

  def destroy
    @micropost.destroy
    redirect_back_or root_path   
  end

  private

  def authorized_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_path if @micropost.nil?
  end

end