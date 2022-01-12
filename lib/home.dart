import 'package:bank_sampah_app/Users.dart';
import 'package:bank_sampah_app/chat.dart';
import 'package:bank_sampah_app/edit_profile1.dart';
import 'package:bank_sampah_app/menu.dart';
import 'package:bank_sampah_app/riwayat_transaksi_chart.dart';
import 'package:bank_sampah_app/sign_in/sign_in_screen.dart';
import 'package:bank_sampah_app/transaksi.dart';
import 'package:bank_sampah_app/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi, ';
    }
    if (hour < 17) {
      return 'Selamat Siang, ';
    }
    return 'Selamat Malam, ';
  }

  Users? users;
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    String nama;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height + 100,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            greeting(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => Menu());
                            },
                            child: Image.asset(
                              "assets/images/icon_toggle.png",
                              width: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: UserServices.getUser(user!.uid),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.data != null) {
                              Users data = snapshot.data as Users;
                              nama = data.name;
                              return Padding(
                                padding: const EdgeInsets.only(left: 22),
                                child: Text(
                                  (nama == "") ? "Pengguna" : nama,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.only(left: 22),
                                child: Text(
                                  "Pengguna",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }
                          } else {
                            return SizedBox();
                          }
                        }),
                    RiwayatTransaksiChart(),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          DateFormat('EEEE, d MMM, yyyy').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Harga Sampah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.115,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/plastic.png",
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Harga Jual",
                            style: TextStyle(fontSize: 14, color: Color(0xFFDCC600), fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plastik",
                                style: TextStyle(fontSize: 14, color: Color(0xFFDCC600), fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "1500",
                                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "kg",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plastik",
                                style: TextStyle(fontSize: 14, color: Color(0xFFDCC600), fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "1500",
                                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "kg",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plastik",
                                style: TextStyle(fontSize: 14, color: Color(0xFFDCC600), fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "1500",
                                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "kg",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.115,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/plastic.png",
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF8FD7FF),
                            Color(0xFF96D9FF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Harga Beli",
                            style: TextStyle(fontSize: 14, color: Color(0xFF00A3FF), fontWeight: FontWeight.bold),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plastik",
                                style: TextStyle(fontSize: 14, color: Color(0xFF00A3FF), fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "1500",
                                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "kg",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plastik",
                                style: TextStyle(fontSize: 14, color: Color(0xFF00A3FF), fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "1500",
                                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "kg",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Plastik",
                                style: TextStyle(fontSize: 14, color: Color(0xFF00A3FF), fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Rp",
                                style: TextStyle(fontSize: 10, color: Colors.black),
                              ),
                              Text(
                                "1500",
                                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    "kg",
                                    style: TextStyle(fontSize: 10, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavBar(),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 75,
              height: 100,
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 75,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Get.to(EditProfile1()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/icon_profil.png",
                        width: 50,
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => Transaksi()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/icon_transaksi.png",
                        width: 50,
                      ),
                      Text(
                        "Transaksi",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => Chat()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/icon_chat.png",
                        width: 50,
                      ),
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
