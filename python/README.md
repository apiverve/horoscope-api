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

query = { "sign": "aries" }

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
query = { "sign": "aries" }
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

---

## Error Handling

The API client provides comprehensive error handling through the `HoroscopeAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient, HoroscopeAPIClientError

api = HoroscopeAPIClient("[YOUR_API_KEY]")

query = { "sign": "aries" }

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

query = { "sign": "aries" }

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

query = { "sign": "aries" }

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

query = { "sign": "aries" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_horoscope.apiClient import HoroscopeAPIClient

api = HoroscopeAPIClient("[YOUR_API_KEY]")

query = { "sign": "aries" }

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
