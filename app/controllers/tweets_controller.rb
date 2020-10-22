class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "ついーとしました"
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end







end
