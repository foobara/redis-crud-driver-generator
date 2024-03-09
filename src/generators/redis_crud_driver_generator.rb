module Foobara
  module Generators
    module RackConnectorGenerator
      module Generators
        class RackConnectorGenerator < Foobara::FilesGenerator
          class << self
            def manifest_to_generator_classes(manifest)
              case manifest
              when RackConnectorConfig
                [
                  Generators::GemfileGenerator
                ]
              else
                # :nocov:
                raise "Not sure how build a generator for a #{manifest}"
                # :nocov:
              end
            end
          end

          alias rack_connector_config relevant_manifest

          def templates_dir
            # :nocov:
            "#{__dir__}/../../templates"
            # :nocov:
          end

          # TODO: promote this up to base project
          def ==(other)
            # :nocov:
            self.class == other.class && rack_connector_config == other.rack_connector_config
            # :nocov:
          end

          def hash
            rack_connector_config.hash
          end
        end
      end
    end
  end
end
