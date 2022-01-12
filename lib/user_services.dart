import 'package:cloud_firestore/cloud_firestore.dart';

import 'Users.dart';

class UserServices {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  static Future<void> saveUser(String id, email, name, noTelp, provinsi, kabKota, kecamatan, kelurahan, alamat, kodePos, profilePicture,
      ktpPicture, withKtpPicture) async {
    await userCollection.doc(id).set({
      "userID": id,
      "email": email,
      "name": name,
      "noTelp": noTelp,
      "provinsi": provinsi,
      "kabKota": kabKota,
      "kecamatan": kecamatan,
      "kelurahan": kelurahan,
      "alamat": alamat,
      "kodepos": kodePos,
      "profilePicture": profilePicture,
      "ktpPicture": ktpPicture,
      "withKtpPicture": withKtpPicture,
    });
  }

  static Future<void> updateUser(String id, email, name, noTelp, provinsi, kabKota, kecamatan, kelurahan, alamat, kodePos, profilePicture,
      ktpPicture, withKtpPicture) async {
    await userCollection.doc(id).update({
      "userID": id,
      "email": email,
      "name": name,
      "noTelp": noTelp,
      "provinsi": provinsi,
      "kabKota": kabKota,
      "kecamatan": kecamatan,
      "kelurahan": kelurahan,
      "alamat": alamat,
      "kodePos": kodePos,
      "profilePicture": profilePicture,
      "ktpPicture": ktpPicture,
      "withKtpPicture": withKtpPicture,
    });
  }

  static Future<dynamic> getUser(String userID) async {
    QuerySnapshot snapshot = await userCollection.where("userID", isEqualTo: userID).get();

    if (snapshot.docs.isEmpty) {
      return null;
    }
    return Users(
      userID,
      snapshot.docs[0].get("email"),
      name: snapshot.docs[0].get('name'),
      noTelp: snapshot.docs[0].get('noTelp'),
      provinsi: snapshot.docs[0].get('provinsi'),
      kabKota: snapshot.docs[0].get('kabKota'),
      kecamatan: snapshot.docs[0].get('kecamatan'),
      kelurahan: snapshot.docs[0].get('kelurahan'),
      alamat: snapshot.docs[0].get('alamat'),
      kodePos: snapshot.docs[0].get('kodePos'),
      profilePicture: snapshot.docs[0].get('profilePicture'),
      ktpPicture: snapshot.docs[0].get('ktpPicture'),
      withKtpPicture: snapshot.docs[0].get('withKtpPicture'),
    );
  }
}
