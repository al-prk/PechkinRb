module Pechkin
  class Member < Model
    attr_reader :raw

    FIELDS = [
      :id,
      :list_id,
      :email,
      :state,
      :merge_1,
      :merge_2,
      :merge_3,
      :merge_4,
      :merge_5,
      :optin_time,
      :unsub_time,
      :lastedit_time
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

    def delete_member
      connection.call_method('lists.delete_member', id_params)
    end

    def update_member(params)
      connection.call_method('lists.update_member', params.merge(id_params))
    end

    def list
      connection.get_list(list_id)
    end

    private

    def id_params
      {member_id: id}
    end

  end
end