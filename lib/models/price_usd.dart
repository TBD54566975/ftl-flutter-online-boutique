class PriceUsd {
  final String currencyCode;
  final int units;
  final int nanos;

  PriceUsd({
    required this.currencyCode,
    required this.units,
    required this.nanos,
  });

  factory PriceUsd.fromJson(Map<String, dynamic> json) {
    return PriceUsd(
      currencyCode: json['currencyCode'],
      units: json['units'],
      nanos: json['nanos'],
    );
  }
}
