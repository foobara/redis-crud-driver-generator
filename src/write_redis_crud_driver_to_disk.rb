require_relative "generate_redis_crud_driver"

module Foobara
  module Generators
    module RedisCrudDriverGenerator
      class WriteRedisCrudDriverToDisk < Foobara::Generators::WriteGeneratedFilesToDisk
        class << self
          def generator_key
            "redis-crud-driver"
          end
        end

        depends_on GenerateRedisCrudDriver

        inputs do
          redis_crud_driver_config RedisCrudDriverConfig, default: RedisCrudDriverConfig.new
          # TODO: should be able to delete this and inherit it
          output_directory :string
        end

        def execute
          generate_file_contents
          write_all_files_to_disk
          run_post_generation_tasks

          stats
        end

        def output_directory
          inputs[:output_directory] || default_output_directory
        end

        def default_output_directory
          "."
        end

        def generate_file_contents
          # TODO: just pass this in as the inputs instead of the redis_crud_driver??
          self.paths_to_source_code = run_subcommand!(GenerateRedisCrudDriver,
                                                      redis_crud_driver_config.attributes)
        end

        def run_post_generation_tasks
          Dir.chdir output_directory do
            bundle_install
            rubocop_autocorrect
          end
        end

        def bundle_install
          puts "bundling..."
          cmd = "bundle install"

          Bundler.with_unbundled_env do
            run_cmd_and_write_output(cmd, raise_if_fails: false)
          end
        end

        def rubocop_autocorrect
          Open3.popen3("bundle exec rubocop --no-server -A") do |_stdin, _stdout, stderr, wait_thr|
            exit_status = wait_thr.value
            unless exit_status.success?
              # :nocov:
              warn "WARNING: could not rubocop -A. #{stderr.read}"
              # :nocov:
            end
          end
        end
      end
    end
  end
end
