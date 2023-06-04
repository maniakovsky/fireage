// ignore: camel_case_types
class topIslands {
  // ignore: prefer_typing_uninitialized_variables
  var username;
  // ignore: prefer_typing_uninitialized_variables
  var value;
  // ignore: prefer_typing_uninitialized_variables

  topIslands({
    required this.username,
    required this.value,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'value': value,
      };
  static topIslands fromJson(Map<String, dynamic> json) => topIslands(
        username: json['username'],
        value: json['value'],
      );
}
