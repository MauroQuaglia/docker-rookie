require 'testcontainers'
require_relative 'lib/redis_cache'

describe 'Miscellanea' do
  before do
    @redis_container = Testcontainers::DockerContainer.new("redis:6.2-alpine").with_exposed_ports(6379)
    @redis_container.start
  end

  it 'Redis test' do
    host = @redis_container.host
    port = @redis_container.mapped_port(6379)

    @redis = RedisCache.new(host, port)

    expect(@redis.size).to eq(0)
    @redis.set("my_key", 100)
    expect(@redis.size).to eq(1)
    sleep 120
  end

  after do
    @redis_container.stop if @redis_container
  end

end