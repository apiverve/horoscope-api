# Horoscope API - Ruby Gem

Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs. Pass a sign name to receive today's forecast text; paid tiers add birthdate lookups, mood, lucky numbers, sign compatibility, and sign facts like the ruling planet, opposite sign, brightest star and days until the sign's season.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_horoscope'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_horoscope
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_horoscope'

# Initialize the client
client = APIVerve::Horoscope::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ sign: "aries" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ sign: "aries" })
  puts response["data"]
rescue APIVerve::Horoscope::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Horoscope::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Horoscope::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "color": "green",
    "compatibility": [
      "leo",
      "sagittarius"
    ],
    "horoscope": "Today, the celestial alignment initiates a deep dive into your emotional landscapes, prompting you to analyze your hidden sentiments to strengthen existing links and navigate difficulties with loved ones more successfully. Open communication becomes essential, allowing you to gracefully balance individual desires. Financially, shrewd judgments keep a cautious route, reducing unnecessary risks and consolidating existing assets. Pay concentrated consideration not to let minor grievances cloud your judgement, strive to discover common understanding and resolve internal clashes diplomatically to facilitate individual advancement, reinforcing your bonds through vulnerability while navigating the ups and downs of interpersonal relationships cautiously keeping everything in balance.",
    "luckyNumber": 12,
    "luckyTime": "8:00 AM",
    "mood": "excited",
    "sign": "aries",
    "zodiac": {
      "element": "fire",
      "name": "Aries",
      "stone": "bloodstone",
      "symbol": "♈",
      "ruler": "Mars",
      "modality": "cardinal",
      "opposite": "libra",
      "brightestStar": {
        "name": "Hamal",
        "description": "The head of the Ram",
        "magnitude": 2
      },
      "season": {
        "start": "03-21",
        "end": "04-20",
        "inSeason": false,
        "daysUntil": 169
      }
    }
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/horoscope?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/horoscope?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/horoscope?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
