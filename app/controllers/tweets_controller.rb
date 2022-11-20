class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    render 'tweets/index'
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render 'tweets/create'
    end
  end

  def destroy
    @tweets = Tweet.find_by(user_id: params[:user_id])

    if @tweet and @tweet.destroy
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
