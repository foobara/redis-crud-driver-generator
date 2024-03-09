require_relative "src/version"

Gem::Specification.new do |spec|
  spec.name = "foobara-redis-crud-driver-generator"
  spec.version = Foobara::Generators::RedisCrudDriverGenerator::VERSION
  spec.authors = ["Miles Georgi"]
  spec.email = ["azimux@gmail.com"]

  spec.summary = "Generates a Foobara redis_crud_driver"
  spec.homepage = "https://github.com/foobara/generators-redis-crud-driver-generator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= #{File.read("#{__dir__}/.ruby-version")}"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir[
    "lib/**/*",
    "src/**/*",
    "LICENSE.txt"
  ]

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
