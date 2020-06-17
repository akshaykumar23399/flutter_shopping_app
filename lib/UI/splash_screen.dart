import 'package:bookbuddy/UI/loginUI.dart';
import 'package:bookbuddy/UI/main_screen.dart';
import 'package:bookbuddy/Utils/data.dart';
import 'package:bookbuddy/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initiate(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'icon/icon.png',
          height: 120,
          width: 120,
        ),
      ),
    );
  }

  void initiate(BuildContext context) async {
    sharedPreference = await SharedPreferences.getInstance();
    userUID = sharedPreference.get('uid') ?? null;
    debugPrint(userUID);
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushAndRemoveUntil(
        (userUID == null)
            ? CustomPageBuilder(LoginPage())
            : CustomPageBuilder(MainScreen()),
            (Route<dynamic> route) => false);
  }
}