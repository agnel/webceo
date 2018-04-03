# Webceo

[![Gem Version](https://badge.fury.io/rb/webceo.svg)][gem_version]
[![Gem](https://img.shields.io/gem/dv/webceo/stable.svg)][gem_downloads]
![GitHub tag](https://img.shields.io/github/tag/agnel/webceo.svg)
[![Liberapay receiving](https://img.shields.io/liberapay/receives/agnelwaghela.svg)][liberapay_donate_link]

[gem_version]: https://badge.fury.io/rb/webceo
[gem_downloads]: https://rubygems.org/gems/webceo
[liberapay_donate_link]: https://liberapay.com/agnelwaghela/donate

Integrate your ruby application with this `webceo` gem to perform the api action using your webceo account. Take a look at the [Webceo API Reference](https://www.webceo.com/api-documentation.htm).

## Getting Started

Add this line to your application's Gemfile:

```ruby
gem 'webceo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webceo

## Usage

```ruby

# Configure the gem
Webceo.configure do |config|
  # set the api_key option as per your convenience, for example using environment variables
  config.api_key = ENV['WEBCEO_API_KEY']
end

# initialize an instance of the Client
client = Webceo::Api::Client.new

# get the list of all methods
client.list_methods # => ['get_projects', 'get_project', ...]

# get list of all the projects, see api reference
client.get_projects({ :id => 'my_request_id' })
# => [{:id=>'my_request_id', :data=>[{:project=>"8ady5y7e36", :domain=>"example.com", :user=>["user1@yoursite.com", "user2@yoursite.com", ... ]}, {:project=>"asg4563wef", :domain=>"example.com", :user=>["user3@yoursite.com", "user4@yoursite.com", ... ]}], :method=>"get_projects"}]

# get a single project
client.get_project({ :project => '8ady5y7e36' })
# => [{:id=>nil, :data=>{:project=>"8ady5y7e36", :domain=>"example.com", :user=>["user1@yoursite.com", "user2@yoursite.com", ... ]}, :method=>"get_projects"}]

```

## Contributing

[![Open Source Helpers](https://www.codetriage.com/agnel/webceo/badges/users.svg)][open_source_helpers]
![Maintenance](https://img.shields.io/maintenance/yes/2018.svg)

[open_source_helpers]: https://www.codetriage.com/agnel/webceo

Bug reports and pull requests are welcome on GitHub at https://github.com/agnel/webceo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Check out the [Webceo Ruby Gem Google Group](https://groups.google.com/forum/#!forum/webceo-api-client/)


## License

[![license](https://img.shields.io/github/license/agnel/webceo.svg)][mit_license]

[mit_license]: http://opensource.org/licenses/MIT

Webceo is released under the [MIT License](http://opensource.org/licenses/MIT).

## Todo

- [ ] Configuration Support
- [ ] Generator for initializer with configuration boilerplate
- [ ] Batch Operations Support
- [ ] Specs
