# Horoscope API - PHP Package

Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs. Pass a sign name to receive today's forecast text; paid tiers add birthdate lookups, mood, lucky numbers, sign compatibility, and sign facts like the ruling planet, opposite sign, brightest star and days until the sign's season.

## Installation

Install via Composer:

```bash
composer require apiverve/horoscope
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Horoscope\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'sign' => 'aries',
    'period' => 'daily'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Horoscope\Client;
use APIVerve\Horoscope\Exceptions\APIException;
use APIVerve\Horoscope\Exceptions\ValidationException;

try {
    $response = $client->execute(['sign' => 'aries', 'period' => 'daily']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/horoscope?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/horoscope?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/horoscope?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
