import 'package:flutter/material.dart';
import 'package:ultra_notes/sign_up.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(_formKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Registration Successful!'),),
        );
    }
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) { return 'Password missing';}
    if (value.length<6) { return 'Password should be at least 6 characters';}
    return null;
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) { return 'Email missing';}

    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {return 'Enter valid Email';}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
          children: [
            SizedBox(height: 80.0,),
            
            SizedBox(
              width: 250,
              child: Text("Welcome!",
              textAlign: TextAlign.center, 
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)
              )
              ),
            SizedBox(height: 50.0,),

            TextFormField(
              style: TextStyle(color: Colors.white, ),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Email", Icons.email),
                validator: _validateEmail
                ),
            SizedBox(height: 16.0,),

            TextFormField(
              style: TextStyle(color: Colors.white, ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: _buildInputDecoration("Password", Icons.password),
                validator: _validatePassword
                ),
            SizedBox(height: 40.0,),

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: _submitForm, 
                child: Text("Login", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),)),
            ),
            SizedBox(height: 20.0,),

            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()),);
              },
              child: Text("No account? Sign up", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))
            )

          ],
          ),
          ),
      ),
    );
  }
  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration( 
                fillColor: Color(0xAA494A59),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0x35949494))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                filled: true,
                labelStyle: TextStyle(color: Color(0xFF949494)),
                labelText: label,
                suffixIcon: Icon(suffixIcon, color: Color(0xFF949494)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
  }
}