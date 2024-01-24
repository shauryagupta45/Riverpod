// ignore_for_file: file_names, unnecessary_import, unused_import, override_on_non_overriding_member

import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/main.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserProvider(input : userNo, num : 1, valuee :false)).when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) => setState(() {
                userNo = value;
              }),
            ),
            Center(
              child: Text("${data.name.toString()}  ${data.email.toString()}"),
            )
          ],
        ),
      );
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}

// class HomeScreen2 extends ConsumerWidget {
//   const HomeScreen2({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final user = ref.watch(fetchUserProvider);

//     return ref.watch(fetchUserProvider).when(data: (data) {
//       return Scaffold(
//         appBar: AppBar(),
//         body:  Column(
//           children: [
//             Center(
//               child: Text("${data.name.toString()}  ${data.email.toString()}"),
//             )
//           ],
//         ),
//       );
//     },
//     error: (error, stackTrace) {
//       return Scaffold(
//         body : Center(
//           child: Text(error.toString()),
//         ),
//       );
//     }, loading: () {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     });

//     // return Scaffold(
//     //   body: ref.watch(streamProvider).when(data: (data) {
//     //     return Text(data.toString());
//     //   }, error: (error, stackTrace) {
//     //     return Center(
//     //       child: Text(error.toString()),
//     //     );
//     //   }, loading: () {
//     //     return const Center(
//     //       child: CircularProgressIndicator(),
//     //     );
//     //   }),
//     // );
//   }
// }
