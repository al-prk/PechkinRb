module Pechkin
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

    def initialize(connection, doc)
      super(connection, doc)
      FIELDS.each do |field|
        instance_variable_set :"@#{field}", doc[field.to_s]
      end
    end

    def get_members(params = {})
      connection.call_method('lists.get_members', params.merge(id_params)).map {|member| Pechkin::Member.new(connection, member)}
    end

    private

    def id_params
      {list_id: id}
    end
  end
end
