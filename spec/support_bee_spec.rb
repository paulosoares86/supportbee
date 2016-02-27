require './spec/spec_helper'
require './support_bee'
require './spec/lib/support_bee'

describe SupportBee do

  describe "Initialization" do
    it "create an instance without auth_token" do
      expect { SupportBee.new }.to raise_error(MissingTokenException)
    end

    it "create an instance without auth_token" do
      expect { SupportBee.new(auth_token: 'AUTH_TOKEN') }.to raise_error(MissingSubdomainException)
    end
  end

  describe "Tickets" do
    let (:client) {SupportBee.new(auth_token: 'AUTH_TOKEN', subdomain: 'xyz')}

    it "get the correct base url" do
      expect(client.get_tickets).to include 'https://xyz.supportbee.com'
    end

    it "read tickets" do
      expect(client.get_tickets).to include :get
      expect(client.get_tickets).to include 'tickets'
    end
  end
end
