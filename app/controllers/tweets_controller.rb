class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  before_action :authenticate_user, only:[:new, :edit, :show, :destroy]

  def index
    @tweets = Tweet.all.order("id DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to tweets_path, notice: "つい〜としたよ"
      else
        render :new
      end
    end
  end

  def edit
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "けしたよ"
  end

  def update
    if @tweet.update(tweet_params)
       redirect_to tweets_path, notice: "なおしたよ"
    else
      render :edit
    end
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
