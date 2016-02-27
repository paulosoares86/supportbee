require './spec/spec_helper'
require './wrapper'


describe SupportBee do
  describe "Tickets" do
    it "create an instance without auth_token" do
      expect { SupportBee.new }.to raise_error(MissingTokenException)
    end

  end
end
