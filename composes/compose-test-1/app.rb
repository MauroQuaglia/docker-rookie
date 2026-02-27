require "sinatra"
require "redis"

get "/hello" do
  count = get_hit_count()
  return "Hello World! I have been seen #{count} times!\n"
end

private

def get_hit_count
  redis = Redis.new(host: 'my-redis', port: 6379)
  redis.incr('hits')
end