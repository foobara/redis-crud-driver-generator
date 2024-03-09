RSpec.describe Foobara::Generators::RedisCrudDriverGenerator::GenerateRedisCrudDriver do
  let(:inputs) do
    {}
  end
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }

  it "generates a redis_crud_driver" do
    expect(outcome).to be_success

    expect(result.keys).to include("boot/redis.rb")
  end
end
