class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
