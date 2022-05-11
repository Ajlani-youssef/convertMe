import 'dart:convert';

Conversion conversionFromJson(String str) => Conversion.fromJson(json.decode(str));

String conversionToJson(Conversion data) => json.encode(data.toJson());

class Conversion {
  Conversion({
    this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.ammount,
    required this.result,
  });

  String? id;
  late String from;
  late String to;
  late DateTime date;
  late double ammount;
  late double result;

  factory Conversion.fromJson(Map<String, dynamic> json) => Conversion(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        date: json["date"],
        ammount: json["amount"].toDouble(),
        result: json["result"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "date": date,
        "amount": ammount,
        "result": result,
      };
}
