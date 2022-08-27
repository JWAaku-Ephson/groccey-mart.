// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceey_mart_authentication/profile.dart';
import 'package:groceey_mart_authentication/profile_edit.dart';
import 'package:groceey_mart_authentication/sign_in.dart';
import 'package:groceey_mart_authentication/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
      // home: SignUpView(),
    ),
  );
}
