import 'package:bank_sampah_app/auth_services.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:bank_sampah_app/sign_in/sign_in_screen.dart';
import 'package:bank_sampah_app/tukar_poin.dart';
import 'package:bank_sampah_app/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isLoaded = false;
  String nama = "", noTelp = "", id = "", profilePicture = "";
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    if (!isLoaded) {
      UserServices.getUser(user!.uid).then((value) {
        id = user.uid;
        nama = value.name;
        noTelp = value.noTelp;
        profilePicture = value.profilePicture;

        setState(() {});
      });

      isLoaded = true;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              Get.offAll(Home());
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.green.shade900,
                ),
                Text(
                  "Home",
                  style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Menu",
          style: TextStyle(color: Colors.green.shade900, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF527D46),
                Color(0xFF83B644),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF507B45),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: (profilePicture != "")
                          ? NetworkImage(profilePicture)
                          : NetworkImage("https://drive.google.com/uc?export=view&id=1ppxe1_XSKreXilD6uomTjsPt6rlJlfBc"),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        noTelp,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        (id == "") ? "" : id.substring(0, 8),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2 - 40) / 2,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFDCC600),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "GOLD",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/medal_backdrop.png"),
                            alignment: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your Experience",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green.shade900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "150",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/dollar_backdrop.png"),
                            alignment: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your Balance",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.green.shade900,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "1260",
                              style: TextStyle(
                                fontSize: 28,
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => TukarPoin());
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2 - 40) / 2,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFDCC600),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tukar Poin",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green.shade900,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: Colors.green.shade900,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Daftar Misi",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(18),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Mission(
                      checked: true,
                      mission: "Melakukan tiga kali transaksi penukaran sampah",
                      balance: "100",
                      experience: "75",
                    ),
                    Mission(
                      checked: false,
                      mission: "Mengumpulkan sampah lebih dari tiga kilo",
                      balance: "70",
                      experience: "40",
                    ),
                    Mission(
                      checked: false,
                      mission: "Melakukan transaksi sampah kertas sebanyak sekali",
                      balance: "30",
                      experience: "10",
                    ),
                    Mission(
                      checked: false,
                      mission: "Memilah sampah sesuai dengan jenisnya",
                      balance: "30",
                      experience: "10",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MenuButton(
                image: "assets/images/problem.png",
                text: "Ulasan dan Saran",
                background: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              MenuButton(
                image: "assets/images/call.png",
                text: "Tentang",
                background: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              MenuButton(
                image: "assets/images/sent.png",
                text: "Bantuan",
                background: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  AuthServices.signOut();
                  Get.offAll(SignInScreen());
                },
                child: MenuButton(
                  image: "assets/images/exit.png",
                  text: "Keluar",
                  background: Color(0xFFFF8C8C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, this.image, this.text, this.background}) : super(key: key);

  final String? image;
  final String? text;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image!,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}

class Mission extends StatelessWidget {
  const Mission({Key? key, this.checked, this.mission, this.balance, this.experience}) : super(key: key);

  final bool? checked;
  final String? mission;
  final String? balance;
  final String? experience;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: (checked!) ? Color(0xFF507B45) : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey),
              ),
              child: (checked!)
                  ? Icon(
                      Icons.done,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              mission!,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              width: (MediaQuery.of(context).size.width / 4),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green.shade900),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Balance",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.green.shade900,
                    ),
                  ),
                  Text(
                    "+$balance",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: (MediaQuery.of(context).size.width / 4),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.green.shade900),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Experience",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.green.shade900,
                    ),
                  ),
                  Text(
                    "+$experience",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
