import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_rounded),
              Text('Sign Up'),
            ],
          ),
          Text('Register Account'),
          Text('Complete your details or continue \nwith social media'),
          TextFormField(),
          TextFormField(),
          TextFormField(),
          TextButton(
            onPressed: printSalam,
            child: Text('Continue'),
          ),
          Row(
            children: [
              Container(
                width: 14,
                height: 14,
                color: Colors.blue,
              ),
              Container(
                width: 14,
                height: 14,
                color: Colors.red,
              ),
              Container(
                width: 14,
                height: 14,
                color: Colors.green,
              ),
            ],
          ),
          Text(
              'By continuing your confirm that you agree with our Term and Condition'),
        ],
      ),
    );
  }

  void printSalam() {
    print('salam');
  }
}
