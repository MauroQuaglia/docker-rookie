require "sinatra"
require "redis"

get "/hello" do
  count = get_hit_count()
  machine_name = File.read('/etc/app/stuff.conf')
  return "Hello World! I have been seen #{count} times in the #{machine_name}!\n"
end

private

def get_hit_count
  # Essendo sulla stessa rete si parlano per nome del service.
  # Va bene sia in locale che sullo Swarm.
  redis = Redis.new(host: 'backend', port: 6379)
  redis.incr('hits')
end