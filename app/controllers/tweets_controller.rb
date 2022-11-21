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

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end
end
