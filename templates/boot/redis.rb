default_serializers = [
  Foobara::CommandConnectors::Serializers::ErrorsSerializer,
  Foobara::CommandConnectors::Serializers::JsonSerializer
]

redis_crud_driver = Foobara::CommandConnectors::Http::Rack.new(default_serializers:)

# redis_crud_driver.connect(SomeCommandOrOrgOrDomain, suffix: "Atom", atomic_entities: true)

RACK_CONNECTOR = redis_crud_driver
