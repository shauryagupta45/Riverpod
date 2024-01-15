// ignore_for_file: file_names, unnecessary_import

import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/main.dart';

class HomeScreen2 extends ConsumerWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    return user.when(data: (data) {
      return Scaffold(
        appBar: AppBar(),
        body:  Column(
          children: [
            Center(
              child: Text("${data.name.toString()}  ${data.email.toString()}"),
            )
          ],
        ),
      );
    }, 
    error: (error, stackTrace) {
      return Scaffold(
        body : Center(
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
