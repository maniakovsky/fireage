// ignore: camel_case_types
class topEconomy {
  // ignore: prefer_typing_uninitialized_variables
  var username;
  // ignore: prefer_typing_uninitialized_variables
  var value;
  // ignore: prefer_typing_uninitialized_variables

  topEconomy({
    required this.username,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'value': value,
      };
  static topEconomy fromJson(Map<String, dynamic> json) => topEconomy(
        username: json['username'],
        value: json['value'],
      );
}
