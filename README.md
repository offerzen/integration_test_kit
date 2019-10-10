# Integration Test Kit
Integration Test Kit provides a small DSL for defining integration test commands, and an endpoint for calling them locally.

The initial use case was for running integration test commands for specific testing scenarios in [Cypress](https://www.cypress.io), such as cleaning the test database or creating seed data.

Integration Test Kit is inspired by the functionality of [Cypress On Rails](https://github.com/shakacode/cypress-on-rails). 

## Usage
You'll need to define commands within a directory of your choosing. Commands are set up using a simple DSL:
```ruby
IntegrationTestKit.define do
  command :example do
    puts 'Ruby code can be run here'
  end
end  
```

You can then run commands with a POST to `/<name_of_mount_path>/commands?name=<name_of_command>`, or with `"name": "example"` in the body as JSON.

If you're using Cypress, you can add a command to your `support/commands.js` file to make this easier:
```js
Cypress.Commands.add('appCommand', command => {
  cy.request({
    method: 'POST',
    url: `/<name_of_mount_path>/commands`,
    body: {
      name: command
    }
  })
})
```

## Installation
### Things to note
* Integration Test Kit is meant for usage within the test environment only. Don't include it or configure it in production.
* There is a check to ensure that the gem is only configured for the test environment during configuration and when running commands.  
* The gem is a Rails Engine, and is meant for usage within a Rails application.

Add this line to your application's Gemfile in the test group:

```ruby
group :test do
  gem 'integration_test_kit'
end
```

And then run:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install integration_test_kit
```

Configure Integration Test Kit in an initializer, or in `config/environments/test.rb`. Currently, the only configuration option is the commands load path:
```ruby
  IntegrationTestKit.configure do |config|
    config.commands_load_path = 'spec/cypress/commands'
  end
```

Create commands within a Ruby file inside the commands load path directory (eg. `test.rb`).

```ruby
require 'integration_test_kit'

IntegrationTestKit.define do
  command :example do
    puts 'Ruby code can be run here'
  end
  
  command :another_example do
    puts 'Ruby code can be run here'
  end
end  
```

Mount the routes within your application (`routes.rb` or equivalent):
```ruby
if Rails.env.test?
  mount IntegrationTestKit::Engine => '/integration_test_kit'
end  
```

You are now able to run commands with a POST to `/integration_test_kit/commands/name=example`, or with `"name": "example"` in the body as JSON.

## Contributing
Feel free to create an issue or submit a PR. 

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
