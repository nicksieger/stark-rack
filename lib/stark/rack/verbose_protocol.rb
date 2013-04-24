class Stark::Rack
  # Slightly more verbose protocol so that we can get the field names included.
  class VerboseProtocol < Thrift::BinaryProtocol
    def write_field_begin(name, type, id)
      write_string(name)
      super
    end

    def write_field_stop
      write_string ""
      super
    end

    def read_field_begin
      name = read_string
      result = super
      result[0] = name unless name.empty?
      result
    end
  end

  class VerboseProtocolFactory < Thrift::BinaryProtocolFactory
    def get_protocol(trans)
      return VerboseProtocol.new(trans)
    end
  end
end
