import 'dart:convert';

Conversion conversionFromJson(String str) => Conversion.fromJson(json.decode(str));

String conversionToJson(Conversion data) => json.encode(data.toJson());

class Conversion {
  Conversion({
    this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.amount,
    required this.result,
  });

  String? id;
  late String from;
  late String to;
  late String date;
  late double amount;
  late double result;

  factory Conversion.fromJson(Map<String, dynamic> json) => Conversion(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        date: json["date"],
        amount: json["amount"].toDouble(),
        result: json["result"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "date": date,
        "amount": amount,
        "result": result,
      };
}
