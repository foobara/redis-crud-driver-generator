require_relative "redis_crud_driver_generator"

module Foobara
  module Generators
    module RedisCrudDriverGenerator
      module Generators
        class EnvDevelopmentLocalGenerator < RedisCrudDriverGenerator
          def applicable?
            envfile_contents !~ /^[# ]*REDIS_URL=/
          end

          def template_path
            ".env.development.local"
          end

          def target_path
            template_path
          end

          def generate(_elements_to_generate)
            if envfile_contents.empty?
              "#{redis_url_line}\n"
            else
              [envfile_contents.strip, redis_url_line.strip, ""].join("\n")
            end
          end

          def redis_url_line
            "# REDIS_URL=redis://localhost:6379/2"
          end

          def envfile_contents
            if File.exist?(template_path)
              File.read(template_path)
            else
              ""
            end
          end
        end
      end
    end
  end
end
