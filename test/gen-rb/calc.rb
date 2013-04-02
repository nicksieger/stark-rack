#
# Autogenerated by Thrift Compiler (0.8.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'calc_types'

module Calc
  class Client
    include ::Thrift::Client

    def add(lhs, rhs)
      send_add(lhs, rhs)
      return recv_add()
    end

    def send_add(lhs, rhs)
      send_message('add', Add_args, :lhs => lhs, :rhs => rhs)
    end

    def recv_add()
      result = receive_message(Add_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'add failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_add(seqid, iprot, oprot)
      args = read_args(iprot, Add_args)
      result = Add_result.new()
      result.success = @handler.add(args.lhs, args.rhs)
      write_result(result, oprot, 'add', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Add_args
    include ::Thrift::Struct, ::Thrift::Struct_Union
    LHS = 1
    RHS = 2

    FIELDS = {
      LHS => {:type => ::Thrift::Types::I32, :name => 'lhs'},
      RHS => {:type => ::Thrift::Types::I32, :name => 'rhs'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Add_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::I32, :name => 'success'}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end
