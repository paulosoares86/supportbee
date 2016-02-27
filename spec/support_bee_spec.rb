require './spec/spec_helper'
require './support_bee'


describe SupportBee do
  describe "Tickets" do
    it "create an instance without auth_token" do
      expect { SupportBee.new }.to raise_error(MissingTokenException)
    end

    it "read tickets" do
      client = SupportBee.new(auth_token: 'pywmQ4yzDnDv3MmK1aix')
      expect(client.get_tickets.length).to be > 0
    end
  end
end
