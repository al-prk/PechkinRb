require 'faraday'
require 'faraday_middleware'

module Pechkin
  class Connection

    API_URL = 'https://api.pechkin-mail.ru'

    # Initializes new connection instance
    #
    # @param username [String] Service username
    # @param password [String] Password
    def initialize(username, password)
      @username, @password = username, password
    end

    # Memoized Faraday connection factory
    #
    # @return Faraday connection instance
    def connection
      @conn ||= Faraday.new(:url => 'https://api.pechkin-mail.ru') do |faraday|
        faraday.request  :url_encoded
        faraday.response :json
        faraday.adapter  Faraday.default_adapter
      end
    end

    # Invokes API method by name
    #
    # @param method [String] Method name, corresponding API reference https://pechkin-mail.ru/api/
    # @param params [Hash] Params to be passed
    def call_method(method, params = {})
      response = connection.post '/', {method: method}.merge(credentials).merge(params)
      err_code = response.body["response"]["msg"]["err_code"]
      unless err_code == 0
        raise Pechkin::ApiException.new(response.body["response"]["msg"]["text"])
      end
      response.body["response"]["data"]
    end

    # Invokes 'lists.get' API method
    #
    # @param params [Hash] Params to be passed
    # @return [Array] Array of Pechkin::List instances
    def lists(params = {})
      call_method('lists.get', params).map {|list_raw| Pechkin::List.new(self, list_raw)}
    end


    # Invokes 'lists.get' API method to retrieve single List object
    #
    # @param id [Fixnum] List id
    # @return [Pechkin::List] List instance
    def get_list(id)
      lists(list_id: id)[0]
    end

    # 'list.get' method alias
    #
    alias_method :get, :lists

    # Invokes 'lists.get_member' API method
    #
    # @param email [String] Email for search
    # @return [Array] Array of Pechkin::Member instances
    def get_member(email)
      call_method('lists.get_member', {email: email}).map {|member| Pechkin::Member.new(connection, member)}
    end

    # Invokes 'lists.unsubscribe_member' API method
    #
    # @param params [Hash] Params to be passed
    # @return [Fixnum] Count of unsubscribed members
    def unsubscribe_member(params)
      call_method('lists.unsubscribe_member', params)['unsubscribed']
    end

  private

    def credentials
      {username: @username, password: @password}
    end
  end
end
