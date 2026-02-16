/// Response models for the Horoscope API.

/// API Response wrapper.
class HoroscopeResponse {
  final String status;
  final dynamic error;
  final HoroscopeData? data;

  HoroscopeResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory HoroscopeResponse.fromJson(Map<String, dynamic> json) => HoroscopeResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HoroscopeData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Horoscope API.

class HoroscopeData {
  String? color;
  List<String>? compatibility;
  String? horoscope;
  int? luckyNumber;
  String? luckyTime;
  String? mood;
  String? sign;
  HoroscopeDataZodiac? zodiac;

  HoroscopeData({
    this.color,
    this.compatibility,
    this.horoscope,
    this.luckyNumber,
    this.luckyTime,
    this.mood,
    this.sign,
    this.zodiac,
  });

  factory HoroscopeData.fromJson(Map<String, dynamic> json) => HoroscopeData(
      color: json['color'],
      compatibility: (json['compatibility'] as List?)?.cast<String>(),
      horoscope: json['horoscope'],
      luckyNumber: json['luckyNumber'],
      luckyTime: json['luckyTime'],
      mood: json['mood'],
      sign: json['sign'],
      zodiac: json['zodiac'] != null ? HoroscopeDataZodiac.fromJson(json['zodiac']) : null,
    );
}

class HoroscopeDataZodiac {
  String? element;
  String? name;
  String? stone;
  String? symbol;

  HoroscopeDataZodiac({
    this.element,
    this.name,
    this.stone,
    this.symbol,
  });

  factory HoroscopeDataZodiac.fromJson(Map<String, dynamic> json) => HoroscopeDataZodiac(
      element: json['element'],
      name: json['name'],
      stone: json['stone'],
      symbol: json['symbol'],
    );
}

class HoroscopeRequest {
  String sign;
  bool? yesterday;
  bool? tomorrow;

  HoroscopeRequest({
    required this.sign,
    this.yesterday,
    this.tomorrow,
  });

  Map<String, dynamic> toJson() => {
      'sign': sign,
      if (yesterday != null) 'yesterday': yesterday,
      if (tomorrow != null) 'tomorrow': tomorrow,
    };
}
