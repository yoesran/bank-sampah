class Users {
  final String id;
  final String email;
  final String name;
  final String noTelp;
  final String provinsi;
  final String kabKota;
  final String kecamatan;
  final String kelurahan;
  final String alamat;
  final String kodePos;
  final String profilePicture;
  final String ktpPicture;
  final String withKtpPicture;

  Users(
    this.id,
    this.email, {
    required this.name,
    required this.noTelp,
    required this.provinsi,
    required this.kabKota,
    required this.kecamatan,
    required this.kelurahan,
    required this.alamat,
    required this.kodePos,
    required this.profilePicture,
    required this.ktpPicture,
    required this.withKtpPicture,
  });
}
