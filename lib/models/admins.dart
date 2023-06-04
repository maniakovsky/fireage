class AdminList {
  // ignore: prefer_typing_uninitialized_variables
  var nickname;
  // ignore: prefer_typing_uninitialized_variables
  var avatar;
  // ignore: prefer_typing_uninitialized_variables
  var role;

  AdminList({
    required this.nickname,
    required this.avatar,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'id': nickname,
        'name': avatar,
        'owner': role,
      };
  static AdminList fromJson(Map<String, dynamic> json) => AdminList(
        nickname: json['nickname'],
        avatar: json['avatar'],
        role: json['role'],
      );
}
