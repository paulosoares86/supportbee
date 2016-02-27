# Example

require 'support_bee'

client = SupportBee.new(auth_token: 'your_auth_token', subdomain: 'your_subdomain')

- To get the list of tickets:
client.get_tickets

- The response should be like:

{
  tickets: [
    {
      id:1,
      ...
    },
    {
      id:3
      ...
    }
  ]
}

- To create a new ticket:
new_ticket = {ticket: {payload: 'payload'}}
client.create_ticket(new_ticket)

- and the response should be like
{
  ticket: {
    id: 123,
    ...
  }
}
