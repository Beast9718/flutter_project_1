import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project1/HomePage.dart';
import 'package:project1/auth/AuthService.dart';
import 'package:project1/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers for the requested fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Authservice _authservice = Authservice();
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final firstname = _firstNameController.text.trim();
    final lastname = _lastNameController.text.trim();
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (firstname.isEmpty || lastname.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Note: Ensure your AuthService signup method accepts these 5 arguments
    bool success = await _authservice.signup(
      firstname, 
      lastname, 
      username, 
      email, 
      password
    );

    setState(() {
      _isLoading = false;
    });

    if (success) {
      if (mounted) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap the button to exit
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Registration Successful"),
          content: const Text(
            "Please check your email for a verification link to activate your account.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Pop the dialog first
                Navigator.of(context).pop();
                // Then navigate to SigninPage
                context.go('/signin');
              },
              child: const Text(
                "Back to Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signup failed. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
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
                  const SizedBox(height: 20),
                  _logo(),
                  const SizedBox(height: 30),
                  _signupForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Row(
      children: const [
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

  Widget _signupForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create Account',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        const Text(
          'Fill in your details below to get started.',
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 94, 104, 109),
          ),
        ),
        const SizedBox(height: 25),
        
        // First Name & Last Name in a Row
        Row(
          children: [
            Expanded(child: _inputField('First Name', _firstNameController)),
            const SizedBox(width: 10),
            Expanded(child: _inputField('Last Name', _lastNameController)),
          ],
        ),
        const SizedBox(height: 15),
        
        _inputField('Username', _usernameController),
        const SizedBox(height: 15),
        
        _inputField('Email Address', _emailController),
        const SizedBox(height: 15),
        
        _inputField('Password', _passwordController, isPassword: true),
        
        const SizedBox(height: 30),
        Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton.icon(
                  onPressed: _handleSignup,
                  label: const Text('Sign Up'),
                  icon: const Icon(Icons.person_add),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                ),
        ),
        Center(
          child: TextButton(
            onPressed: (){context.go('/signin');
      },
            child: const Text('Already have an account? Login'),
          ),
        ),
      ],
    );
  }

  Widget _inputField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 180, 180, 180)),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }
}