class TweetsController < ApplicationController

  before_action :authenticate_user!

  def index
    @tweets = Tweet.all
  end

  def new
    @user = User.new
    @tweet = Tweet.new(user: @user)
  end

  def edit
  end

  def show
  end
end
