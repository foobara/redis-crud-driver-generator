require "foobara/redis_crud_driver"

Foobara::Persistence.default_crud_driver = Foobara::RedisCrudDriver.new
