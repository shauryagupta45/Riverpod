import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;
  User({required this.name, required this.age});
}

//This will help to change the User info
class UserNotifier extends StateNotifier<User> {
  UserNotifier(
      super.state); // We need to call constructor otherwise it'll give an error
}
