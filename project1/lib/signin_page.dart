import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project1/HomePage.dart';
import 'package:project1/auth/AuthService.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Authservice _authservice = Authservice();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('please enter login credentials')));
      return;
    }

    setState(() {
      _isLoading=true;
    });

    bool success=await _authservice.login(email, password);
    setState(() {
      _isLoading=false;
    });

    if(success){
      if(mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));
      }
    }
    else{if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('login failed check user creds')));
    }}
  }

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
          child: SingleChildScrollView(
            child: Padding(
               padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Logo(),
                  SizedBox(height: 40),
                  Signin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget Logo() {
  return Row(
    children: [
      Image(
        image: AssetImage('assets/images/shirts.webp'),
        height: 30,
        width: 30,
      ),
      SizedBox(width: 10),
      Text(
        'Kapde',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget Signin() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Sign In Account',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      ),
      SizedBox(height: 10),
      Text(
        'Enter your login credentials to log in\nyour account.',
        style: TextStyle(
          fontSize: 16,
          color: const Color.fromARGB(255, 94, 104, 109),
        ),
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: OutlinedButton.icon(
              onPressed: () {},
              clipBehavior: Clip.antiAlias,
              label: Text('Google'),
              icon: Icon(Icons.abc),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                iconSize: 30,
                textStyle: TextStyle(fontSize: 18),
                foregroundColor: Colors.black,
                side: BorderSide(
                  color: const Color.fromARGB(255, 125, 124, 124),
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: OutlinedButton.icon(
              onPressed: () {},
              clipBehavior: Clip.antiAlias,
              label: Text('Apple'),
              icon: Icon(Icons.apple),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                iconSize: 30,
                textStyle: TextStyle(fontSize: 18),
                foregroundColor: Colors.black,
                side: BorderSide(
                  color: const Color.fromARGB(255, 125, 124, 124),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: Color.fromARGB(255, 125, 124, 124),
            ),
          ),
          SizedBox(width: 5),
          Text('OR'),
          SizedBox(width: 5),
          Expanded(
            child: Divider(
              thickness: 2,
              color: Color.fromARGB(255, 125, 124, 124),
            ),
          ),
        ],
      ),
      SizedBox(height: 30),
      Text(
        'Email Addtress',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hint: Text(
              'Email Address',
              style: TextStyle(color: const Color.fromARGB(255, 93, 93, 93)),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Password',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextField(
          obscureText: true,
          controller: _passwordController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hint: Text(
              'password',
              style: TextStyle(color: const Color.fromARGB(255, 93, 93, 93)),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ),
      SizedBox(height: 20),
      Center(
        child: _isLoading?CircularProgressIndicator():ElevatedButton.icon(
          onPressed: _handleLogin,
          label: Text('Login'),
          icon: Icon(Icons.login),
        ),
      ),
    ],
  );
}

}

