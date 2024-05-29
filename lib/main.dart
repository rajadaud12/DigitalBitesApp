import 'package:flutter/material.dart';
import 'package:flutter_app/signin.dart';
import 'BrowseMenu.dart';
import 'Cart.dart';
import 'Checkout.dart';
import 'Product.dart';
import 'SignUp.dart';
import 'SplashScreen.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen());
          case '/signIn':
            return MaterialPageRoute(builder: (context) => SignInPage());
          case '/signUp':
            return MaterialPageRoute(builder: (context) => SignUpPage());
          case '/homePage':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/browseMenu':
            final args = settings.arguments as Category;
            return MaterialPageRoute(
              builder: (context) => BrowseMenu(category: args),
            );
          case '/productPage':
            final args = settings.arguments as Item;
            return MaterialPageRoute(builder: (context) => ProductPage(item: args));
          case '/cartPage':
            return MaterialPageRoute(builder: (context) => CartPage());
          case '/checkout':
            return MaterialPageRoute(builder: (context) => Checkout());
          default:
            return null;
        }
      },
    );
  }
}
