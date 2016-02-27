require 'rest-client'

class MissingTokenException < Exception
end

SupportBeeResponse = Struct.new(:code, :body)

class SupportBee

  BASE_URI = 'https://paulosoares.supportbee.com'

  def initialize(auth_token: nil)
    raise MissingTokenException if auth_token.nil?
    @auth_token = auth_token
  end

  def get_tickets
    execute(:get, 'tickets')
  end

  private

    def try_convert_to_hash(str)
      JSON.parse(str, symbolize_names: true)
    rescue
      str
    end

    def execute(method, uri, payload = nil)
      url = "#{BASE_URI}/#{uri}?auth_token=#{@auth_token}"
      args = payload.nil? ? [url, @options] : [url, payload, @options]
      resp = RestClient.send(method, *args)
      SupportBeeResponse.new(resp.code, try_convert_to_hash(resp.body))
    end

end
