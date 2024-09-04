import "package:basics/Splash%20Screens/home.dart";
import "package:basics/auth_country/auth_country.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({super.key});

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () { 
    print("Navigating to Homepage Now");
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(
    builder: (_) => const AuthCountry()
    ),
    );
    
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
    overlays:  SystemUiOverlay.values);
 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   
   return   Scaffold(
   
     body:   Container(
     decoration: const BoxDecoration(
     color: Color(0xFF01446B)
     ),
       child: const Center(
       
         child: SizedBox(
         width: 300,
         height: 300,
           child: DecoratedBox(
             decoration:  BoxDecoration(
            image:  DecorationImage(
              image:  AssetImage('assets/images/logo.jpg'),
              fit: BoxFit.cover
           
            ),
             ),
           ),
         ),
       ),
     ),
   );

  }
}

