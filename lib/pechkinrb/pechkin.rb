require 'faraday'
require 'faraday_middleware'

module Pechkin
  class Connection

    API_URL = 'https://api.pechkin-mail.ru'

    def initialize(username, password)
      @username, @password = username, password
    end

    def connection
      @conn ||= Faraday.new(:url => 'https://api.pechkin-mail.ru') do |faraday|
        faraday.request  :url_encoded
        faraday.response :json
        faraday.adapter  Faraday.default_adapter
      end
    end

    def call_method(method, params = {})
      response = connection.post '/', {method: method}.merge(credentials).merge(params)
      err_code = response.body["response"]["msg"]["err_code"]
      unless err_code == 0
        raise Pechkin::ApiException.new(response.body["response"]["msg"]["text"])
      end
      response.body["response"]["data"]
    end

    def lists(params = {})
      call_method('lists.get', params).map {|list_raw| Pechkin::List.new(self, list_raw)}
    end

    def get_list(id)
      lists(list_id: id)[0]
    end

    def get_member(email)
      call_method('lists.get_member', {email: email}).map {|member| Pechkin::Member.new(connection, member)}
    end

  private

    def credentials
      {username: @username, password: @password}
    end
  end
end
