default_serializers = [
  Foobara::CommandConnectors::Serializers::ErrorsSerializer,
  Foobara::CommandConnectors::Serializers::JsonSerializer
]

rack_connector = Foobara::CommandConnectors::Http::Rack.new(default_serializers:)

# rack_connector.connect(SomeCommandOrOrgOrDomain, suffix: "Atom", atomic_entities: true)

RACK_CONNECTOR = rack_connector
