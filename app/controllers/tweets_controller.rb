class TweetsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tweet, only: [:update, :edit, :show]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet created successuflly' }
      else
        format.html { render :new }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet updated successfully' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  private

    def tweet_params
      params.require(:tweet).permit(:message, :user_id)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

end
