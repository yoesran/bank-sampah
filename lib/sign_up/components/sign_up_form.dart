import 'package:bank_sampah_app/auth_services.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:bank_sampah_app/user_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    noTelpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          buildPasswordFormField(),
          buildRePasswordFormField(),
          buildNoTelpFormField(),
          SizedBox(
            height: 15,
          ),
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
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (!(emailController.text.trim() != "" &&
                            passwordController.text.trim() != "" &&
                            rePasswordController.text.trim() != "" &&
                            noTelpController.text.trim() != "")) {
                          Get.snackbar(
                            "Pesan",
                            "Mohon isi data yang diminta",
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                        } else if (passwordController.text != rePasswordController.text) {
                          Get.snackbar(
                            "Pesan",
                            "Password tidak sama",
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                        } else if (passwordController.text.length < 6) {
                          Get.snackbar(
                            "Pesan",
                            "Panjang password harus lebih dari 6 karakter",
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                        } else if (!(EmailValidator.validate(emailController.text))) {
                          Get.snackbar(
                            "Pesan",
                            "Format email tidak sesuai",
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                        } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(noTelpController.text)) {
                          Get.snackbar(
                            "Pesan",
                            "Format no telepon tidak sesuai",
                            snackPosition: SnackPosition.TOP,
                            isDismissible: false,
                            backgroundColor: Colors.white.withOpacity(0.5),
                            duration: Duration(seconds: 3),
                            margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                            colorText: Colors.black,
                            borderRadius: 0,
                          );
                        } else {
                          setState(() {
                            isPressed = !isPressed;
                          });
                          SignInSignUpResult result = await AuthServices.signUpEmail(emailController.text, passwordController.text);
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
                            UserServices.saveUser(
                                result.user!.uid, result.user!.email, "", noTelpController.text, "", "", "", "", "", "", "", "", "");
                            Get.offAll(() => Home());
                          }
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

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Email Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
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
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.white)),
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

  TextFormField buildRePasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: rePasswordController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Re-Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide(color: Colors.white)),
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

  TextFormField buildNoTelpFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: noTelpController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(
            Icons.contact_phone,
            size: 18,
          ),
        ),
      ),
    );
  }
}
