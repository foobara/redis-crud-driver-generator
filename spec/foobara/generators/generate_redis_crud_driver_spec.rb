RSpec.describe Foobara::Generators::RackConnectorGenerator::GenerateRackConnector do
  let(:inputs) do
    {}
  end
  let(:command) { described_class.new(inputs) }
  let(:outcome) { command.run }
  let(:result) { outcome.result }

  it "generates a rack_connector" do
    expect(outcome).to be_success

    expect(result.keys).to include("boot/rack.rb")
  end
end
