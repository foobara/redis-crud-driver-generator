module Foobara
  module Generators
    module RedisCrudDriverGenerator
      module Generators
        # Kind of tricky... for the first time we will be loading an existing file in the working directory
        # and modifying it.
        class GemfileGenerator < RedisCrudDriverGenerator
          def applicable?
            gemfile_contents !~ /^\s*gem\s*["']foobara-redis-crud-driver\b/
          end

          def template_path
            "Gemfile"
          end

          def target_path
            "Gemfile"
          end

          def generate(_elements_to_generate)
            match = gemfile_contents.match(/^gem /)

            if match
              new_entry = 'gem "foobara-redis-crud-driver"'
              "#{match.pre_match}\n#{new_entry}\n#{match}#{match.post_match}"
            else
              # TODO: maybe print a warning and return the original Gemfile
              # :nocov:
              raise "Not sure how to inject redis_crud_driver into the Gemfile"
              # :nocov:
            end
          end

          def gemfile_contents
            File.read(template_path)
          end
        end
      end
    end
  end
end
