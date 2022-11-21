json.tweets do
  json.array! @tweets do |tweet|
    json.id        tweet.id
    json.username  tweet.username
    json.message   tweet.message
  end
end
