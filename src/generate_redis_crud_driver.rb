require "pathname"

require_relative "redis_crud_driver_config"

module Foobara
  module Generators
    module RedisCrudDriverGenerator
      class GenerateRedisCrudDriver < Foobara::Generators::Generate
        class MissingManifestError < RuntimeError; end

        possible_error MissingManifestError

        inputs RedisCrudDriverConfig

        def execute
          include_non_templated_files

          add_initial_elements_to_generate

          each_element_to_generate do
            generate_element
          end

          paths_to_source_code
        end

        attr_accessor :manifest_data

        def base_generator
          Generators::RedisCrudDriverGenerator
        end

        # TODO: delegate this to base_generator
        def templates_dir
          # TODO: implement this?
          # :nocov:
          "#{__dir__}/../templates"
          # :nocov:
        end

        def add_initial_elements_to_generate
          elements_to_generate << redis_crud_driver_config
        end

        def redis_crud_driver_config
          @redis_crud_driver_config ||= RedisCrudDriverConfig.new(inputs)
        end
      end
    end
  end
end
