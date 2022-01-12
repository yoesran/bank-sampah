import 'dart:convert';
import 'package:bank_sampah_app/Users.dart';
import 'package:bank_sampah_app/edit_profile1.dart';
import 'package:bank_sampah_app/edit_profile3.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:bank_sampah_app/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EditProfile2 extends StatefulWidget {
  @override
  _EditProfile2State createState() => _EditProfile2State();
}

class _EditProfile2State extends State<EditProfile2> {
  TextEditingController alamatController = TextEditingController();
  TextEditingController kodePosController = TextEditingController();

  String? _valProvince, _valCity, _valDistrict, _valWard;
  List<dynamic>? _dataProvince, _dataCity, _dataDistrict, _dataWard;

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

  void getProvince() async {
    final response =
        await http.get(Uri.parse("https://ibnux.github.io/data-indonesia/propinsi.json")); //untuk melakukan request ke webservice
    var listData = jsonDecode(response.body); //lalu kita decode hasil datanya
    setState(() {
      _dataProvince = listData; // dan kita set kedalam variable _dataProvince
    });
  }

  void getCity(Object? idProvince) async {
    final response = await http.get(Uri.parse("https://ibnux.github.io/data-indonesia/kabupaten/${idProvince}.json"));
    var listData = jsonDecode(response.body);
    setState(() {
      _dataCity = listData;
    });
  }

  void getDistrict(Object? idCity) async {
    final response = await http.get(Uri.parse("https://ibnux.github.io/data-indonesia/kecamatan/${idCity}.json"));
    var listData = jsonDecode(response.body);
    setState(() {
      _dataDistrict = listData;
    });
  }

  void getWard(Object? idDistrict) async {
    final response = await http.get(Uri.parse("https://ibnux.github.io/data-indonesia/kelurahan/${idDistrict}.json"));
    var listData = jsonDecode(response.body);
    setState(() {
      _dataWard = listData;
    });
  }

  @override
  void initState() {
    super.initState();
    getProvince();
  }

  bool isLoaded = false;
  String name = "", noTelp = "";
  String profilePicture = "", ktpPicture = "", withKtpPicture = "";

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (!isLoaded) {
      UserServices.getUser(user!.uid).then((value) {
        alamatController.text = value.alamat;
        kodePosController.text = value.kodePos;

        name = value.name;
        noTelp = value.noTelp;

        profilePicture = value.profilePicture;
        ktpPicture = value.ktpPicture;
        withKtpPicture = value.withKtpPicture;

        if (value.provinsi != "") {
          _valProvince = value.provinsi;
          getCity(_valProvince);
          _valCity = value.kabKota;
          getDistrict(_valCity);
          _valDistrict = value.kecamatan;
          getWard(_valDistrict);
          _valWard = value.kelurahan;
        }

        isLoaded = true;
      });
    }
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: (MediaQuery.of(context).size.height > 700)
              ? MediaQuery.of(context).size.height - appBar.preferredSize.height - 32
              : MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Lengkapi Data Domisili Kamu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Provinsi",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("Pilih Provinsi"),
                        value: _valProvince,
                        items: _dataProvince?.map((item) {
                          return DropdownMenuItem(
                            child: Text(item['nama']),
                            value: item['id'],
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valProvince = value as String;
                            _valCity = null;
                            _valDistrict = null;
                            _valWard = null;
                          });
                          _dataDistrict = null;
                          _dataWard = null;
                          getCity(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kota/Kabupaten",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("Pilih Kabupaten atau Kota"),
                        value: _valCity,
                        items: _dataCity?.map((item) {
                          return DropdownMenuItem(
                            child: Text("${item['nama']}"),
                            value: item['id'],
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valCity = value as String;

                            _valDistrict = null;
                            _valWard = null;
                          });
                          _dataWard = null;
                          getDistrict(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kecamatan",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("Pilih Kecamatan"),
                        value: _valDistrict,
                        items: _dataDistrict?.map((item) {
                          return DropdownMenuItem(
                            child: Text("${item['nama']}"),
                            value: item['id'],
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valDistrict = value as String;
                            _valWard = null;
                          });
                          getWard(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Kelurahan/Desa",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("Pilih Kelurahan"),
                        value: _valWard,
                        items: _dataWard?.map((item) {
                          return DropdownMenuItem(
                            child: Text("${item['nama']}"),
                            value: item['id'],
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _valWard = value as String;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Alamat",
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
                    controller: alamatController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Alamat",
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
                    "Kode Pos",
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
                    controller: kodePosController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Kode Pos",
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
                    GestureDetector(
                      onTap: () {
                        Get.off(() => EditProfile1());
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                            color: Colors.green.shade900,
                          ),
                          Text(
                            "KEMBALI",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "2/3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (!(_valProvince != "" &&
                            _valCity != "" &&
                            _valDistrict != "" &&
                            _valWard != "" &&
                            alamatController.text.trim() != "" &&
                            kodePosController.text.trim() != "")) {
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
                        } else {
                          setState(() {
                            // isPressed = !isPressed;
                          });
                          UserServices.updateUser(user!.uid, user.email, name, noTelp, _valProvince, _valCity, _valDistrict, _valWard,
                              alamatController.text, kodePosController.text, profilePicture, ktpPicture, withKtpPicture);
                          Get.to(() => EditProfile3());
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
