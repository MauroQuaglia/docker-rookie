require "sinatra"
require "redis"

get "/hello" do
  count = get_hit_count()
  return "Hello World! I have been seen #{count} times!\n"
end

private

def get_hit_count
  Redis.new(host: '192.168.56.11', port: 9736)
end