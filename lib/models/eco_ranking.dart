// ignore: camel_case_types
class ecoRanking {
  // ignore: prefer_typing_uninitialized_variables
  var nickname;
  // ignore: prefer_typing_uninitialized_variables
  var avatar;
  // ignore: prefer_typing_uninitialized_variables
  int balance;

  ecoRanking({
    required this.nickname,
    required this.avatar,
    required this.balance,
  });

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'avatar': avatar,
        'balance': balance,
      };
  static ecoRanking fromJson(Map<String, dynamic> json) => ecoRanking(
        nickname: json['nickname'],
        avatar: json['avatar'],
        balance: json['balance'],
      );
}
