import 'dart:io';
import 'dart:typed_data';

import 'package:bank_sampah_app/Users.dart';
import 'package:bank_sampah_app/edit_profile2.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:bank_sampah_app/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';

class EditProfile3 extends StatefulWidget {
  @override
  _EditProfile3State createState() => _EditProfile3State();
}

class _EditProfile3State extends State<EditProfile3> {
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

  bool isLoaded = false, isChecked = false, isPressed = false, isNotEmpty = false;
  List<bool> isSelected = [false, false, false];

  File? profilePicture;
  File? ktpPicture;
  File? withKtpPicture;

  Users? users;

  // Future<File> getImageFromURL(Uri strURL) async {
  //   final http.Response responseData = await http.get(strURL);
  //   Uint8List uint8list = responseData.bodyBytes;
  //   var buffer = uint8list.buffer;
  //   ByteData byteData = ByteData.view(buffer);
  //   var tempDir = await getTemporaryDirectory();
  //   File file;
  //   return file = await File('${tempDir.path}/img').writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  // }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    if (!isLoaded) {
      UserServices.getUser(user!.uid).then((value) {
        users = value;

        if (value.profilePicture != "") {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = true;
          }
          isChecked = true;
          isNotEmpty = true;

          // profilePicture = getImageFromURL(Uri.parse(value.profilePicture));
          // ktpPicture = getImageFromURL(Uri.parse(value.ktpPicture)) as File?;
          // withKtpPicture = getImageFromURL(Uri.parse(value.withKtpPicture)) as File?;
        }
        isLoaded = true;

        setState(() {});
      });
    }
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - appBar.preferredSize.height - 32,
          padding: const EdgeInsets.all(16.0),
          child: (isPressed)
              ? Center(
                  child: SpinKitFadingCircle(
                    color: Colors.green.shade200,
                    size: 100,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lengkapi Foto Kamu",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            getImage().then((value) {
                              setState(() {
                                profilePicture = value;
                                isSelected[0] = true;
                              });
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: (isSelected[0]) ? Colors.green : Colors.black,
                                width: (isSelected[0]) ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: (isSelected[0]) ? Colors.green : Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Foto Diri Kamu",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: (isSelected[0]) ? Colors.green : Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            getImage().then((value) {
                              setState(() {
                                ktpPicture = value;
                                isSelected[1] = true;
                              });
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: (isSelected[1]) ? Colors.green : Colors.black,
                                width: (isSelected[1]) ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: (isSelected[1]) ? Colors.green : Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Foto Tanda Pengenal",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: (isSelected[1]) ? Colors.green : Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            getImage().then((value) {
                              setState(() {
                                withKtpPicture = value;
                                isSelected[2] = true;
                              });
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: (isSelected[2]) ? Colors.green : Colors.black,
                                width: (isSelected[2]) ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline,
                                      color: (isSelected[2]) ? Colors.green : Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Foto Kamu Bersama Tanda Pengenal",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: (isSelected[2]) ? Colors.green : Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Flexible(
                                child: Text(
                                  "Dengan melengkapi data diri , saya setuju pada Syarat & Ketentuan dan Kebijakan Transh Induc",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
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
                              Get.off(EditProfile2());
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
                            "3/3",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (isNotEmpty) {
                                setState(() {
                                  isPressed = !isPressed;
                                });
                                // String profileLink = await uploadImage(profilePicture);
                                // String ktpLink = await uploadImage(ktpPicture);
                                // String withKtpLink = await uploadImage(withKtpPicture);

                                UserServices.updateUser(
                                  user!.uid,
                                  user.email,
                                  users!.name,
                                  users!.noTelp,
                                  users!.provinsi,
                                  users!.kabKota,
                                  users!.kecamatan,
                                  users!.kelurahan,
                                  users!.alamat,
                                  users!.kodePos,
                                  users!.profilePicture,
                                  users!.ktpPicture,
                                  users!.withKtpPicture,
                                );

                                Get.offAll(() => Home());
                              } else if (!(isChecked && profilePicture != null && ktpPicture != null && withKtpPicture != null)) {
                                Get.snackbar(
                                  "Pesan",
                                  "Mohon isi data yang diminta",
                                  snackPosition: SnackPosition.TOP,
                                  isDismissible: false,
                                  backgroundColor: Colors.white.withOpacity(0.75),
                                  duration: Duration(seconds: 3),
                                  margin: EdgeInsets.only(bottom: 0, left: 0, right: 0),
                                  colorText: Colors.black,
                                  borderRadius: 0,
                                );
                              } else {
                                setState(() {
                                  isPressed = !isPressed;
                                });
                                String profileLink = await uploadImage(profilePicture);
                                String ktpLink = await uploadImage(ktpPicture);
                                String withKtpLink = await uploadImage(withKtpPicture);

                                UserServices.updateUser(user!.uid, user.email, users!.name, users!.noTelp, users!.provinsi, users!.kabKota,
                                    users!.kecamatan, users!.kelurahan, users!.alamat, users!.kodePos, profileLink, ktpLink, withKtpLink);

                                Get.offAll(() => Home());
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "SELESAI",
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

Future<File?> getImage() async {
  try {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return File(image!.path);
  } catch (e) {
    return null;
  }
}

//* Method to uploading image to firebase storage
Future<String> uploadImage(File? image) async {
  String fileName = basename(image!.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = ref.putFile(image);
  // TaskSnapshot snapshot = await task.onComplete;

  return await (await task).ref.getDownloadURL();
}
