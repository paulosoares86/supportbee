# Example usage

``` ruby
require 'support_bee'

client = SupportBee.new(auth_token: 'your_auth_token', subdomain: 'your_subdomain')

# To get the list of tickets use
client.get_tickets

# and the response will be in format

# {
#  tickets: [
#    {
#      id:1,
#      ...
#    },
#    {
#      id:3
#      ...
#    }
#  ]
# }

```

In order to create a ticket you can use

``` ruby
new_ticket = {ticket: {payload: 'payload'}}
client.create_ticket(new_ticket)

# and the response should be in format
# {
#  ticket: {
#    id: 123,
#    ...
#  }
# }
```
