import 'package:bank_sampah_app/sign_in/components/sign_in_form.dart';
import 'package:bank_sampah_app/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Color(0xFF507B45),
            ),
            child: Column(
              children: [
                SignInForm(),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account ? ",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () => Get.offAll(() => SignUpScreen()),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
