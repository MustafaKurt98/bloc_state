import 'package:bloc_state/bloc/bloc_cats_view.dart';
import 'package:bloc_state/global_management/global_manage_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GlobalManageView(),
    );
  }
}

