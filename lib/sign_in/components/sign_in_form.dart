import 'package:bank_sampah_app/auth_services.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: 15),
          buildPasswordFormField(),
          SizedBox(height: 15),
          (isPressed)
              ? SpinKitFadingCircle(
                  color: Colors.green.shade200,
                  size: 50,
                )
              : Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: ElevatedButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        setState(() {
                          isPressed = !isPressed;
                        });
                        SignInSignUpResult result = await AuthServices.signInEmail(emailController.text, passwordController.text);

                        if (result.user == null) {
                          Get.snackbar(
                            "Pesan",
                            result.message,
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                        } else {
                          Get.offAll(() => Home());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF83B542),
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          textStyle: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: Colors.white)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(
            Icons.person,
            size: 18,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: Colors.white)),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(
            Icons.lock_outline,
            size: 18,
          ),
        ),
      ),
    );
  }
}
