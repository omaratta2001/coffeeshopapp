import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/User/UserController.dart';
import 'package:coffeeshopapp/Model/Usermodel.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var error;
  String er = '';

  @override
  Widget build(BuildContext context) {
    String selectedGender = 'Male';
    bool _isScrollEnabled = true;

    return Scaffold(
      appBar: CustomAppBar(
        prefix: 'assets/Icons/Back.svg',
        suffix: '',
        ismain: false,
        opactiy: 0,
        Title: 'SignUp',
        havesuffix: false,
        ontap: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: const Color(0xFF0C0F14),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "Sign up to get started",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              SizedBox(height: 32),

              // First Name
              Row(
                children: [
                  Expanded(
                      child: buildInput("First Name", firstNameController)),
                  Gap(10),
                  // Last Name
                  Expanded(child: buildInput("Last Name", lastNameController)),
                ],
              ),

              // Email
              buildInput("Email", emailController),

              // Password
              buildInput("Password", passwordController, isPassword: true),

              // Address
              buildInput("Address", addressController),

              // Phone
              // buildInput("Phone", phoneController),

              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xFF141921),
                  filled: true,
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                initialCountryCode: 'EG', // الكود الافتراضي
                onChanged: (phone) {
                  print(phone.completeNumber); // الكود + الرقم
                },
                validator: (value) {
                  if (value == null || value.isValidNumber()) {
                    return 'Phone is required';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
                dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
              ),

              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
                dropdownColor: const Color(0xFF141921),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF141921),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
                items: ["Male", "Female", "Other"]
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  selectedGender = value!;
                },
              ),
              SizedBox(height: 14),
              er == 'Email already exists'
                  ? Text(
                      er,
                      style: TextStyle(fontSize: 14, color: red),
                    )
                  : Text(''),
              SizedBox(
                height: 14,
              ),
              // Sign Up Button
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print(phoneController.text);
                      Usermodel user = new Usermodel(
                          firstname: firstNameController.text,
                          Lastname: lastNameController.text,
                          Email: emailController.text,
                          Password: passwordController.text,
                          Address: addressController.text,
                          phone: phoneController.text,
                          Gender: selectedGender.trim()[0].toUpperCase());
                      error = await register(user);

                      if (error == "User registered successfully") {
                        Navigator.pop(context);
                        er = error;
                      } else if (error == "Email already exists") {
                        er = error;

                        setState(() {});
                      }
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Login redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to login
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Color(0xFF141921),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }
}
