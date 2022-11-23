json.tweets do
  json.array! @tweets do |tweet|
    json.id        tweet.id
    json.user_id  tweet.user.user_id
    json.message   tweet.message
  end
end
