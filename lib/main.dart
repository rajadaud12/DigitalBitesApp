import 'package:flutter/material.dart';
import 'package:flutter_app/signin.dart';
import 'BrowseMenu.dart';
import 'Cart.dart';
import 'Checkout.dart';
import 'Product.dart';
import 'SignUp.dart';
import 'SplashScreen.dart';
import 'homePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) =>  SplashScreen(),
        '/signIn': (context) =>  SignInPage(),
        '/signUp': (context) =>  SignUpPage(),
        '/homePage': (context) =>  HomePage(),
        'browseMenu': (context)=> BrowseMenu(),
        'productPage':(context)=> ProductPage(),
        'cartPage':(context)=> CartPage(),
        'checkout':(context)=> Checkout(),




      },
    );
  }
}