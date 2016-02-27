require './spec/spec_helper'
require './support_bee'

AUTH_TOKEN = 'pywmQ4yzDnDv3MmK1aix'

describe SupportBee do
  describe "Tickets" do

    it "create an instance without auth_token" do
      expect { SupportBee.new }.to raise_error(MissingTokenException)
    end

    it "create an instance without auth_token" do
      expect { SupportBee.new(auth_token: AUTH_TOKEN) }.to raise_error(MissingSubdomainException)
    end

    it "read tickets" do
      client = SupportBee.new(auth_token: AUTH_TOKEN, subdomain: 'paulosoares')
      expect(client.get_tickets.length).to be > 0
    end

    

  end
end
