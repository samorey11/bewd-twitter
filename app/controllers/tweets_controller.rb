class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)

    render 'tweets/index'
  end

  def create
    @tweet = Tweet.new(tweet_params)

    render 'tweets/create' if @tweet.save!
  end

  def destroy
    @tweets = Tweet.find_by(id: params[:id])

    if @tweet&.destroy
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def index_by_user
    @tweets = Tweet.find_by(username: params[:username])

    render 'tweets/find_by_user'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end
