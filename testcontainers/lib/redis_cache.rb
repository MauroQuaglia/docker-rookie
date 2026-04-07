require 'redis'

class RedisCache
  def initialize(host, port)
    @redis = Redis.new(host: host, port: port)
  end

  def size
    @redis.dbsize
  end

  def set(key, value)
    @redis.set(key, value)
  end
end
