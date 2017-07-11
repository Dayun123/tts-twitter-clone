class TweetsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_tweet, only: [:update, :edit, :destroy]

  # Set the @tweets instance variable to be the all tweets, with the most recent tweets first.
  def index
    @tweets = Tweet.order(:created_at)
  end

  # Associate the new tweet with the current_user, this will be done in most of the actions.
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

  # Don't associate showing a tweet with the current user, all users should be able to view all tweets.
  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy

    respond_to do |format|
      if @tweet.destroy
        format.html { redirect_to tweets_url, notice: 'Tweet deleted successfully' }
      else
        format.html { render :index }
      end
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:message, :user_id)
    end

    # Set the current tweet but restrict it to be a tweet that the current user has created. TODO: Add error handling to this.
    def set_tweet
      @tweet = current_user.tweets.find(params[:id])
    end

end
