Example


require 'support_bee'

client = SupportBee.new(auth_token: 'your_auth_token')

# to get the list of tickets:
client.get_tickets

...
