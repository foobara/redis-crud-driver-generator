module Foobara
  module Generators
    module RedisCrudDriverGenerator
      module Generators
        class RedisCrudDriverGenerator < Foobara::FilesGenerator
          class << self
            def manifest_to_generator_classes(manifest)
              case manifest
              when RedisCrudDriverConfig
                [
                  Generators::GemfileGenerator,
                  Generators::EnvDevelopmentLocalGenerator,
                  Generators::EnvTestLocalGenerator
                ]
              else
                # :nocov:
                raise "Not sure how build a generator for a #{manifest}"
                # :nocov:
              end
            end
          end

          alias redis_crud_driver_config relevant_manifest

          def templates_dir
            # :nocov:
            "#{__dir__}/../../templates"
            # :nocov:
          end
        end
      end
    end
  end
end
