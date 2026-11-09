# Horoscope API - Dart/Flutter Client

Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs. Pass a sign name to receive today's forecast text; paid tiers add birthdate lookups, mood, lucky numbers, sign compatibility, and sign facts like the ruling planet, opposite sign, brightest star and days until the sign's season.

[![pub package](https://img.shields.io/pub/v/apiverve_horoscope.svg)](https://pub.dev/packages/apiverve_horoscope)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Horoscope API](https://apiverve.com/marketplace/horoscope?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_horoscope: ^1.2.5
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
      'period': 'daily'
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

## API Reference

- **API Home:** [Horoscope API](https://apiverve.com/marketplace/horoscope?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/horoscope](https://docs.apiverve.com/ref/horoscope?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
