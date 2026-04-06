import 'dart:ffi';

import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(118, 235, 93, 183),
              Color.fromARGB(171, 255, 251, 252),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                    Logo(),
                    SizedBox(height: 40,),
                    Signup(),
              ],
            ),
          )
          )
        ),
    );
}
}

Widget Logo(){
return Row(
children: [
  Image(image: AssetImage('assets/images/shirts.webp'),height: 30,width: 30,),
  SizedBox(width: 10,),
  Text('CompanyName',style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  ),)
],
);
}

Widget Signup(){
  return Align(
    alignment: AlignmentGeometry.topLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign Up Account',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10,),
        Text(
          'Enter your personal data to create\nyour account.',style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(255, 94, 104, 109),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Container(
                  
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    shape: BoxShape.rectangle,
                    
                  ),
                )
            ],
          ),
        )
      ],
    ),
  );
}