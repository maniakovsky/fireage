// ignore: camel_case_types
class bans {
  // ignore: prefer_typing_uninitialized_variables
  var name;
  // ignore: prefer_typing_uninitialized_variables
  var avatar;
  // ignore: prefer_typing_uninitialized_variables
  var operator;
  // ignore: prefer_typing_uninitialized_variables
  var reason;
  // ignore: prefer_typing_uninitialized_variables
  var punishmentType;

  bans({
    required this.name,
    required this.avatar,
    required this.operator,
    required this.reason,
    required this.punishmentType,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatar': avatar,
        'operator': operator,
        'reason': reason,
        'punishmentType': punishmentType,
      };
  static bans fromJson(Map<String, dynamic> json) => bans(
      name: json['name'],
      avatar: json['avatar'],
      operator: json['operator'],
      reason: json['reason'],
      punishmentType: json['punishmentType']);
}
