require 'rest-client'

class MissingTokenException < Exception
end

class MissingSubdomainException < Exception
end

SupportBeeResponse = Struct.new(:code, :body)

class SupportBee

  def initialize(auth_token: nil, subdomain: nil)
    raise MissingTokenException if auth_token.nil?
    raise MissingSubdomainException if subdomain.nil?
    @auth_token = auth_token
    @base_uri = "https://#{subdomain}.supportbee.com"
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
      url = "#{@base_uri}/#{uri}?auth_token=#{@auth_token}"
      args = payload.nil? ? [url, @options] : [url, payload, @options]
      resp = RestClient.send(method, *args)
      SupportBeeResponse.new(resp.code, try_convert_to_hash(resp.body))
    end

end
