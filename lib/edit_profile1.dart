import 'package:bank_sampah_app/Users.dart';
import 'package:bank_sampah_app/edit_profile2.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:bank_sampah_app/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class EditProfile1 extends StatefulWidget {
  @override
  _EditProfile1State createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  AppBar appBar = AppBar(
    elevation: 0,
    leadingWidth: 100,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.offAll(() => Home());
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              "Home",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
    centerTitle: true,
    backgroundColor: Color(0xFF507B45),
    title: Text(
      "Edit Profil",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  bool isLoaded = false;
  String? provinsi, kabKota, kecamatan, kelurahan, alamat, kodePos;
  String profilePicture = "", ktpPicture = "", withKtpPicture = "";

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (!isLoaded) {
      UserServices.getUser(user!.uid).then((value) {
        emailController.text = value.email;
        namaController.text = value.name;
        noTelpController.text = value.noTelp;

        provinsi = value.provinsi;
        kabKota = value.kabKota;
        kecamatan = value.kecamatan;
        kelurahan = value.kelurahan;
        alamat = value.alamat;
        kodePos = value.kodePos;

        profilePicture = value.profilePicture;
        ktpPicture = value.ktpPicture;
        withKtpPicture = value.withKtpPicture;

        isLoaded = true;

        setState(() {});
      });
    }
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - appBar.preferredSize.height - 32,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // FutureBuilder(
              //     future: UserServices.getUser(user!.uid),
              //     builder: (_, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.done) {
              //         if (snapshot.data != null) {
              //           Users data = snapshot.data as Users;
              //           emailController.text = data.email;
              //           namaController.text = data.name;
              //           noTelpController.text = data.noTelp;
              //         }
              //         return SizedBox();
              //       } else {
              //         return SizedBox();
              //       }
              //     }),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Color(0xFF507B45),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: (profilePicture != "")
                            ? NetworkImage(profilePicture)
                            : NetworkImage("https://drive.google.com/uc?export=view&id=1ppxe1_XSKreXilD6uomTjsPt6rlJlfBc"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Nama Lengkap",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: namaController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Nama Lengkap",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No. Telpon",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: noTelpController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "No. Telp (ex: 0812345678)",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          "KEMBALI",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "1/3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!(emailController.text.trim() != "" &&
                            namaController.text.trim() != "" &&
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
                            // isPressed = !isPressed;
                          });
                          UserServices.updateUser(user!.uid, user.email, namaController.text, noTelpController.text, provinsi, kabKota,
                              kecamatan, kelurahan, alamat, kodePos, profilePicture, ktpPicture, withKtpPicture);
                          Get.to(() => EditProfile2());
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            "LANJUT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green.shade900,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.green.shade900,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
