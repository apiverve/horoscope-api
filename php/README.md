# Horoscope API - PHP Package

Horoscope is a simple tool for getting horoscope data. It returns the horoscope for the day.

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
$response = $client->execute(['sign' => 'aries']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Horoscope\Client;
use APIVerve\Horoscope\Exceptions\APIException;
use APIVerve\Horoscope\Exceptions\ValidationException;

try {
    $response = $client->execute(['sign' => 'aries']);
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
      "symbol": "♈"
    }
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/horoscope?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://horoscope.apiverve.com?utm_source=php&utm_medium=readme](https://horoscope.apiverve.com?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
