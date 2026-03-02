require "sinatra"
require "redis"

get "/hello" do
  count = get_hit_count()
  return "Hello World! I have been seen #{count} times!\n"
end

private

def get_hit_count
  # Essendo sulla stessa rete si vparlano per nome.
  redis = Redis.new(host: 'compose-test-1-backend-1', port: 6379)
  redis.incr('hits')
end