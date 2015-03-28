module Pechkin
  class Model
    attr_reader :raw

    def initialize(connection, doc)
      @connection = connection
      @raw = doc
    end

    protected

    def connection
      @connection
    end

  end
end
