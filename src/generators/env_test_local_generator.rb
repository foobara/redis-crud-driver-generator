module Foobara
  module Generators
    module RedisCrudDriverGenerator
      module Generators
        class EnvTestLocalGenerator < EnvDevelopmentLocalGenerator
          def template_path
            ".env.test.local"
          end

          def redis_url_line
            "# REDIS_URL=redis://localhost:6379/3"
          end
        end
      end
    end
  end
end
