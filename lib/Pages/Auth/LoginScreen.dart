import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/User/UserController.dart';
import 'package:coffeeshopapp/Pages/Auth/SignupScreen.dart';
import 'package:coffeeshopapp/Pages/NavbottomScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();
  var error;
  String errors = '';
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
              "assets/Logo/logo.svg",
              width: 170,
            )),
            Gap(10),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Login to your account",
              style: TextStyle(color: Colors.grey[500]),
            ),
            SizedBox(height: 32),

            // Email Field

            // TextField(
            //   style: TextStyle(color: Colors.white),
            //   controller: _emailcontroller,
            //   decoration: InputDecoration(
            //     hintText: "Email",
            //     hintStyle: TextStyle(color: Colors.grey),
            //     filled: true,
            //     fillColor: Color(0xFF141921),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide.none,
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide(
            //         color: isError ? Colors.red : Colors.transparent,
            //       ),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12),
            //       borderSide: BorderSide(
            //         color: isError ? Colors.red : Colors.blue,
            //         width: 2,
            //       ),
            //     ),
            //   ),
            // ),

            TextField(
              controller: _emailcontroller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF141921),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Password Field
            TextField(
              controller: _passwordcontroller,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Color(0xFF141921),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),

            // Forgot password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Login Button
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () async {
                  print(_emailcontroller.text);
                  print(_passwordcontroller.text);
                  error = await login(
                      _emailcontroller.text, _passwordcontroller.text);
                  setState(() {
                    isError = error != null; // true if login failed
                  });

                  if (error != null) {
                    // Show toast/snackbar if needed
                  }
                  if (error == null) {
                    print('Login successful!');

                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return Navbottomscreen();
                    }));

                    setState(() {
                      errors = 'Login successful!';
                    });
                  } else {
                    print('Login failed: $error');
                    setState(() {
                      errors = error;
                    });
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Sign Up Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(color: Colors.grey)),
                TextButton(
                  onPressed: () {},
                  child: InkWell(
                    onTap: () => Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return SignUpScreen();
                    })),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.orange),
                    ),
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
