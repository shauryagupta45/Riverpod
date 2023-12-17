import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/HomeScreen.dart';
import 'package:riverpod_project/users.dart';

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

final userProvider =
    StateNotifierProvider<UserNotifier,User>((ref) => UserNotifier(const User(name: '', age: 0)));
//In angular brackets we have to pass the class we're returning and then the state

 
void main() {
  runApp(const ProviderScope(
      child:
          MyApp())); //This provider keeps tracks of all the providers and ensures that there is no leakage of state inspite of provider being declared globally
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
      home: HomeScreen(),
    );
  }
}
