RSpec.describe Foobara::Generators::RedisCrudDriverGenerator::WriteRedisCrudDriverToDisk do
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }
  let(:errors) { outcome.errors }
  let(:inputs) do
    {
      redis_crud_driver_config:,
      output_directory:
    }
  end
  let(:redis_crud_driver_config) do
    {}
  end
  let(:output_directory) { "#{__dir__}/../../../tmp/redis_crud_driver_test_suite_output" }

  around do |example|
    FileUtils.rm_rf output_directory
    FileUtils.mkdir_p output_directory

    project_fixture_dir = "#{__dir__}/../../fixtures/test-project"

    Dir["#{project_fixture_dir}/*", "#{project_fixture_dir}/.*"].each do |f|
      next if f.end_with?(".")

      FileUtils.cp_r f, output_directory
    end

    Dir.chdir output_directory do
      example.run
    end
  end

  describe "#run" do
    it "contains base files" do
      expect(outcome).to be_success

      expect(command.paths_to_source_code.keys).to include("boot/redis.rb")
    end

    it "updates the Gemfile" do
      expect(outcome).to be_success

      expect(
        command.paths_to_source_code["Gemfile"]
      ).to include('gem "foobara-redis-crud-driver", github: "foobara/redis-crud-driver"')
    end

    context "when .env.test.local already exists" do
      before do
        File.write("#{output_directory}/.env.test.local", "FOO=bar")
      end

      it "succeeds and updates existing .env.test.local" do
        expect(outcome).to be_success

        expect(
          File.read("#{output_directory}/.env.test.local")
        ).to eq("FOO=bar\n# REDIS_URL=redis://localhost:6379/3\n")
      end
    end
  end

  describe "#output_directory" do
    context "with no output directory" do
      let(:inputs) do
        {
          redis_crud_driver_config:
        }
      end

      it "writes files to the current directory" do
        command.cast_and_validate_inputs
        expect(command.output_directory).to eq(".")
      end
    end
  end

  describe ".generator_key" do
    subject { described_class.generator_key }

    it { is_expected.to be_a(String) }
  end
end
