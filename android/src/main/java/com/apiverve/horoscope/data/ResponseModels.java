// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     HoroscopeData data = Converter.fromJsonString(jsonString);

package com.apiverve.horoscope.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static HoroscopeData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(HoroscopeData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(HoroscopeData.class);
        writer = mapper.writerFor(HoroscopeData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// HoroscopeData.java

package com.apiverve.horoscope.data;

import com.fasterxml.jackson.annotation.*;

public class HoroscopeData {
    private String color;
    private String[] compatibility;
    private String horoscope;
    private long luckyNumber;
    private String luckyTime;
    private String mood;
    private String sign;
    private Zodiac zodiac;

    @JsonProperty("color")
    public String getColor() { return color; }
    @JsonProperty("color")
    public void setColor(String value) { this.color = value; }

    @JsonProperty("compatibility")
    public String[] getCompatibility() { return compatibility; }
    @JsonProperty("compatibility")
    public void setCompatibility(String[] value) { this.compatibility = value; }

    @JsonProperty("horoscope")
    public String getHoroscope() { return horoscope; }
    @JsonProperty("horoscope")
    public void setHoroscope(String value) { this.horoscope = value; }

    @JsonProperty("luckyNumber")
    public long getLuckyNumber() { return luckyNumber; }
    @JsonProperty("luckyNumber")
    public void setLuckyNumber(long value) { this.luckyNumber = value; }

    @JsonProperty("luckyTime")
    public String getLuckyTime() { return luckyTime; }
    @JsonProperty("luckyTime")
    public void setLuckyTime(String value) { this.luckyTime = value; }

    @JsonProperty("mood")
    public String getMood() { return mood; }
    @JsonProperty("mood")
    public void setMood(String value) { this.mood = value; }

    @JsonProperty("sign")
    public String getSign() { return sign; }
    @JsonProperty("sign")
    public void setSign(String value) { this.sign = value; }

    @JsonProperty("zodiac")
    public Zodiac getZodiac() { return zodiac; }
    @JsonProperty("zodiac")
    public void setZodiac(Zodiac value) { this.zodiac = value; }
}

// Zodiac.java

package com.apiverve.horoscope.data;

import com.fasterxml.jackson.annotation.*;

public class Zodiac {
    private String element;
    private String name;
    private String stone;
    private String symbol;

    @JsonProperty("element")
    public String getElement() { return element; }
    @JsonProperty("element")
    public void setElement(String value) { this.element = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("stone")
    public String getStone() { return stone; }
    @JsonProperty("stone")
    public void setStone(String value) { this.stone = value; }

    @JsonProperty("symbol")
    public String getSymbol() { return symbol; }
    @JsonProperty("symbol")
    public void setSymbol(String value) { this.symbol = value; }
}