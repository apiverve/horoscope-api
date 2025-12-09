using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.Horoscope
{
    /// <summary>
    /// Query options for the Horoscope API
    /// </summary>
    public class HoroscopeQueryOptions
    {
        /// <summary>
        /// The zodiac sign for which you want to get the horoscope (e.g., aries)
        /// Example: aries
        /// </summary>
        [JsonProperty("sign")]
        public string Sign { get; set; }
    }
}
