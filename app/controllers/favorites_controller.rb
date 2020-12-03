class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのつい〜とをふぁぼったよ"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのつい〜とをあんふぁぼしたよ"
  end

  def show
    @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
  end

end
