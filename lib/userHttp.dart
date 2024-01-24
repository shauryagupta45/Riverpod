// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part  'userHttp.g.dart';

@immutable
class UserHttp {
  final String name;
  final String email;
  const UserHttp({
    required this.name,
    required this.email,
  });

  UserHttp copyWith({
    String? name,
    String? email,
  }) {
    return UserHttp(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory UserHttp.fromMap(Map<String, dynamic> map) {
    return UserHttp(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserHttp.fromJson(String source) =>
      UserHttp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserHttp(name: $name, age: $email)';

  @override
  bool operator ==(covariant UserHttp other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

@riverpod
UserRepo userRepoProvider( UserRepoProviderRef ref) {
  return UserRepo(ref);
}
// final userRepoProvider = Provider((ref) => UserRepo(ref));

class UserRepo {
  final Ref ref;
  UserRepo(this.ref);
  Future<UserHttp> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http
        .get(Uri.parse(url))
        .then((value) => UserHttp.fromJson(value.body));
    //We're just getting the http value, and then we are converting it to user model
  }
}
