# Horoscope API - Dart/Flutter Client

Horoscope is a simple tool for getting horoscope data. It returns the horoscope for the day.

[![pub package](https://img.shields.io/pub/v/apiverve_horoscope.svg)](https://pub.dev/packages/apiverve_horoscope)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Horoscope API](https://horoscope.apiverve.com?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_horoscope: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_horoscope/apiverve_horoscope.dart';

void main() async {
  final client = HoroscopeClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'sign': 'aries',
      'yesterday': ,
      'tomorrow': 
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "color": "purple",
    "compatibility": [
      "leo",
      "sagittarius"
    ],
    "horoscope": "Today, you may feel a strong urge to expand your horizons and explore new opportunities. It's a great time to step out of your comfort zone and try something you've never done before. Trust your intuition and follow your instincts. Remember to stay grounded and maintain a sense of balance in all aspects of your life.",
    "luckyNumber": 1,
    "luckyTime": "1:00 PM",
    "mood": "bored",
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

## API Reference

- **API Home:** [Horoscope API](https://horoscope.apiverve.com?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/horoscope](https://docs.apiverve.com/ref/horoscope?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
