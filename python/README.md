Horoscope API
============

Horoscope fetches daily horoscope readings and sign details for any of the twelve zodiac signs. Pass a sign name to receive today's forecast text; paid tiers add birthdate lookups, mood, lucky numbers, sign compatibility, and sign facts like the ruling planet, opposite sign, brightest star and days until the sign's season.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-horoscope.svg)](https://pypi.org/project/apiverve-horoscope/)

This is a Python wrapper for the [Horoscope API](https://apiverve.com/marketplace/horoscope?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-horoscope
```

Using `pip3`:

```bash
pip3 install apiverve-horoscope
```

---

## Configuration

Before using the Horoscope API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient

# Initialize the client with your APIVerve API key
api = HoroscopeAPIClient("[YOUR_API_KEY]")

query = {
    "sign": "aries",
    "period": "daily"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Horoscope API documentation is found here: [https://docs.apiverve.com/ref/horoscope](https://docs.apiverve.com/ref/horoscope?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_horoscope.apiClient import HoroscopeAPIClient

# Initialize the client with your APIVerve API key
api = HoroscopeAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "sign": "aries",
    "period": "daily"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `HoroscopeAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient, HoroscopeAPIClientError

api = HoroscopeAPIClient("[YOUR_API_KEY]")

query = {
    "sign": "aries",
    "period": "daily"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except HoroscopeAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient, HoroscopeAPIClientError

api = HoroscopeAPIClient("[YOUR_API_KEY]")

query = {
    "sign": "aries",
    "period": "daily"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except HoroscopeAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient, HoroscopeAPIClientError

query = {
    "sign": "aries",
    "period": "daily"
}

# Using context manager ensures proper cleanup
with HoroscopeAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except HoroscopeAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient

# Enable debug mode
api = HoroscopeAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "sign": "aries",
    "period": "daily"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient

api = HoroscopeAPIClient("[YOUR_API_KEY]")

query = {
    "sign": "aries",
    "period": "daily"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
