module Pechkin
  # Mailing list representation class
  class List < Model
    attr_reader :raw

    FIELDS = [
      :id,
      :state,
      :count_active,
      :count_all,
      :name,
      :description,
      :company,
      :abuse_name,
      :phone,
      :address,
      :city,
      :url
    ]

    FIELDS.each do |f|
      attr_reader f
    end

    # Initialize new list instance
    #
    # @param connection [Pachkin::Connection] Active connection
    # @param doc [Hash] API object data
    def initialize(connection, doc)
      super(connection, doc)
      FIELDS.each do |field|
        instance_variable_set :"@#{field}", doc[field.to_s]
      end
    end

    # Invokes 'lists.get_members' API method to retreive list members
    #
    # @param params [Hash] Params to be passed
    # @return [Array] Array of Pechkin::Members instances
    def get_members(params = {})
      connection.call_method('lists.get_members', params.merge(id_params)).map {|member| Pechkin::Member.new(connection, member)}
    end

    private

    def id_params
      {list_id: id}
    end
  end
end
