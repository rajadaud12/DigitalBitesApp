import 'package:flutter/material.dart';
import 'package:flutter_app/signin.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to SignInPage after a delay of 1 second
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/Logo.png', // Place your logo image in the assets folder
              height: 200,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Digital',
                  style: GoogleFonts.pacifico(
                    fontSize: 36,
                    color: Colors.red,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Bites',
                  style: GoogleFonts.pacifico(
                    fontSize: 36,
                    color: Color.fromRGBO(248, 141, 16, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
