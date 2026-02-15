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
        /// The zodiac sign for which you want to get the horoscope
        /// </summary>
        [JsonProperty("sign")]
        public string Sign { get; set; }

        /// <summary>
        /// Set to true to get yesterday's horoscope
        /// </summary>
        [JsonProperty("yesterday")]
        public string Yesterday { get; set; }

        /// <summary>
        /// Set to true to get tomorrow's horoscope
        /// </summary>
        [JsonProperty("tomorrow")]
        public string Tomorrow { get; set; }
    }
}
