/// Response models for the Horoscope API.

/// API Response wrapper.
class HoroscopeResponse {
  final String status;
  final dynamic error;
  final HoroscopeData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  HoroscopeResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory HoroscopeResponse.fromJson(Map<String, dynamic> json) => HoroscopeResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HoroscopeData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Horoscope API.

class HoroscopeData {
  String? color;
  List<String>? compatibility;
  String? date;
  String? horoscope;
  String? period;
  String? periodStart;
  String? periodEnd;
  num? luckyNumber;
  String? luckyTime;
  String? mood;
  String? sign;
  HoroscopeDataZodiac? zodiac;

  HoroscopeData({
    this.color,
    this.compatibility,
    this.date,
    this.horoscope,
    this.period,
    this.periodStart,
    this.periodEnd,
    this.luckyNumber,
    this.luckyTime,
    this.mood,
    this.sign,
    this.zodiac,
  });

  factory HoroscopeData.fromJson(Map<String, dynamic> json) => HoroscopeData(
      color: json['color'],
      compatibility: (json['compatibility'] as List?)?.cast<String>(),
      date: json['date'],
      horoscope: json['horoscope'],
      period: json['period'],
      periodStart: json['periodStart'],
      periodEnd: json['periodEnd'],
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
  String? ruler;
  String? modality;
  String? opposite;
  HoroscopeDataZodiacBrighteststar? brightestStar;
  HoroscopeDataZodiacSeason? season;

  HoroscopeDataZodiac({
    this.element,
    this.name,
    this.stone,
    this.symbol,
    this.ruler,
    this.modality,
    this.opposite,
    this.brightestStar,
    this.season,
  });

  factory HoroscopeDataZodiac.fromJson(Map<String, dynamic> json) => HoroscopeDataZodiac(
      element: json['element'],
      name: json['name'],
      stone: json['stone'],
      symbol: json['symbol'],
      ruler: json['ruler'],
      modality: json['modality'],
      opposite: json['opposite'],
      brightestStar: json['brightestStar'] != null ? HoroscopeDataZodiacBrighteststar.fromJson(json['brightestStar']) : null,
      season: json['season'] != null ? HoroscopeDataZodiacSeason.fromJson(json['season']) : null,
    );
}

class HoroscopeDataZodiacBrighteststar {
  String? name;
  String? description;
  num? magnitude;

  HoroscopeDataZodiacBrighteststar({
    this.name,
    this.description,
    this.magnitude,
  });

  factory HoroscopeDataZodiacBrighteststar.fromJson(Map<String, dynamic> json) => HoroscopeDataZodiacBrighteststar(
      name: json['name'],
      description: json['description'],
      magnitude: json['magnitude'],
    );
}

class HoroscopeDataZodiacSeason {
  String? start;
  String? end;
  bool? inSeason;
  num? daysUntil;

  HoroscopeDataZodiacSeason({
    this.start,
    this.end,
    this.inSeason,
    this.daysUntil,
  });

  factory HoroscopeDataZodiacSeason.fromJson(Map<String, dynamic> json) => HoroscopeDataZodiacSeason(
      start: json['start'],
      end: json['end'],
      inSeason: json['inSeason'],
      daysUntil: json['daysUntil'],
    );
}

class HoroscopeRequest {
  String sign;
  String? period;

  HoroscopeRequest({
    required this.sign,
    this.period,
  });

  Map<String, dynamic> toJson() => {
      'sign': sign,
      if (period != null) 'period': period,
    };
}
