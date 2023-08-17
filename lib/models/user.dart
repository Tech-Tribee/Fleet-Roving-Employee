import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String userName;
  final String password;
  final String address;
  final String company;
  User({
    required this.id,
    required this.userName,
    required this.password,
    required this.address,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'password': password,
      'address': address,
      'company': company,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      userName: map['userName'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      company: map['company'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
