// ignore: camel_case_types
class topPlaytime {
  // ignore: prefer_typing_uninitialized_variables
  var username;
  // ignore: prefer_typing_uninitialized_variables
  var value;

  topPlaytime({
    required this.username,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'value': value,
      };
  static topPlaytime fromJson(Map<String, dynamic> json) => topPlaytime(
        username: json['username'],
        value: json['value'],
      );
}
