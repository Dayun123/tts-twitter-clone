class TweetsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tweet, only: [:update, :edit, :show, :destroy]

  def index
    @tweets = Tweet.order(:created_at)
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)

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

  def destroy

    respond_to do |format|
      if @tweet.destroy
        format.html { redirect_to tweets_url, notice: 'Tweet deleted successfully' }
      else
        format.html { render :index, notice: 'Uh ohhh'}
      end
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:message, :user_id)
    end

    def set_tweet
      @tweet = current_user.tweets.find(params[:id])
    end

end
