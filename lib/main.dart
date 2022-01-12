import 'package:bank_sampah_app/auth_services.dart';
import 'package:bank_sampah_app/edit_profile1.dart';
import 'package:bank_sampah_app/edit_profile2.dart';
import 'package:bank_sampah_app/edit_profile3.dart';
import 'package:bank_sampah_app/home.dart';
import 'package:bank_sampah_app/menu.dart';
import 'package:bank_sampah_app/sign_in/sign_in_screen.dart';
import 'package:bank_sampah_app/sign_up/sign_up_screen.dart';
import 'package:bank_sampah_app/transaksi.dart';
import 'package:bank_sampah_app/tukar_poin.dart';
import 'package:bank_sampah_app/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: GetMaterialApp(
        title: "Bank Sampah",
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
