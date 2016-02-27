require './spec/spec_helper'
require './support_bee'

describe SupportBee do

  describe "Initialization" do
    it "requires auth_token" do
      expect { SupportBee.new }.to raise_error(MissingTokenException)
    end

    it "create an instance without auth_token" do
      expect { SupportBee.new(auth_token: 'AUTH_TOKEN') }.to raise_error(MissingSubdomainException)
    end
  end

  describe "Tickets" do

    let (:client) {SupportBee.new(auth_token: 'AUTH_TOKEN', subdomain: 'xyz')}
    let (:url) {'https://xyz.supportbee.com/tickets?auth_token=AUTH_TOKEN'}

    it "get the correct base url" do
      payload = {
        tickets: [
          {id:1, payload: 'payload1'},
          {id:3, payload: 'payload2'}
        ]
      }
      RestClient.expects(:send).with(:get, url, nil).returns(payload)
      expect(client.get_tickets).to eq payload
    end

    it "creates tickets" do
      new_ticket = {ticket: {payload: 'payload'}}
      response = new_ticket.merge(id: 4)
      RestClient.expects(:send).with(:post, url, new_ticket, nil).returns(response)
      expect(client.create_ticket(new_ticket)).to eq response
    end
  end
end
