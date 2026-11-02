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
response = client.execute({
  sign: "aries",
  period: "daily"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ sign: "aries", period: "daily" })
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
    "color": "orange",
    "compatibility": [
      "leo",
      "sagittarius"
    ],
    "date": "2026-10-26",
    "horoscope": "Today, your natural drive and ambition are amplified, Aries. You're likely to feel a surge of energy, making it an excellent day to tackle challenging projects and assert your leadership. Communication flows well, so don't hesitate to express your ideas clearly and confidently. Be mindful, however, of potential impatience; ensure you're not rushing others or overlooking important details in your eagerness to move forward. A surprise opportunity might arise from an unexpected source, so stay open and adaptable. Financially, a cautious approach is advised, but longterm investments could see positive developments if you've done your due diligence. Listen to your intuition, especially when making significant decisions regarding your career or personal goals. Your courage will be your greatest asset.",
    "period": "daily",
    "periodStart": "2026-10-26",
    "periodEnd": "2026-10-26",
    "luckyNumber": 74,
    "luckyTime": "6:00 AM",
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
        "daysUntil": 145
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
