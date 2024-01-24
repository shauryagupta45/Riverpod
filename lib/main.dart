// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_project/HomeScreen.dart';
import 'package:riverpod_project/logger_riverpod.dart';
import 'package:riverpod_project/userHttp.dart';
import 'package:riverpod_project/users.dart';
import 'package:http/http.dart' as http;

//Providers : There are many types of providers :

//Note that, declaring providers using Provider package and Riverpod package is different, so dont get confused .

// 1) Provider : It's a ready only widget and cannot update the value that is inside of it.

final nameProvider = Provider((ref) {
  return "Shaurya";
});
//ProviderRefs will help us to talk with other providers
//It automatically detects the type you're returning but by default it's null only

// Provider((ref) => 'Shaurya') ; is another way to write it
// By doing Provider<String> ((...)..), we can explicitly mention the return type, that is String.

// 2) StateProvider : It allows to change the value of provider from outside.

final nameProvider1 = StateProvider<String?>((ref) => null);
//we can remove String?, it can also autmatically identify the return type

// 3) StateNotifier and StateNotifierProvider : StateProvider also allows to change but, it will highly depend on the widget, meanwhile our most data is wrapped in a class, for which it is better to user this.

// final userProvider =
//     StateNotifierProvider<UserNotifier,User>((ref) => UserNotifier(const User(name: '', age: 0)));

//In angular brackets we have to pass the class we're returning and then the state
//Now we don't want to pass the constructor of 'User' here , so we'll define the constructor in the state notifier class only. In the end state reach krni hoti h user ki, toh we'll call the state explicitly constructor notifier mei mention krke, and idhr se hataa ke, so our new definition would be :

//3 StateNotifierProvider
final userProvider =
    StateNotifierProvider<UserNotifier, User>((ref) => UserNotifier());

//4 ChangeNotifier
//Only this provider is mutable, all the others are immutable
final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

//5 FutureProvider
//mainly used for http calls

final fetchUserProvider =
    FutureProvider.family.autoDispose((ref, String input) {
  //The autoDispose helps in managing memory leaks and disposing providers,data and states when not in used or that are not reused later
  //We can do the same thing for Stream, Future, ChangeNotifier provider
  //We can do this in StateNotifier too, but autoDispose is not supported in it
  // return UserRepo().fetchUserData();

  final userRepo = ref.watch(userRepoProvider);
  return userRepo.fetchUserData(input);
});
//6
final streamProvider = StreamProvider((ref) async* {
  // FirebaseFirestore.collection('users').doc(userId).snapshots();
  yield [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
});

void main() {
  runApp(
    ProviderScope(
      observers: [
        LoggerRiverpod(),
      ],
      child: const MyApp(),
    ),
  ); //This provider keeps tracks of all the providers and ensures that there is no leakage of state inspite of provider being declared globally
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
