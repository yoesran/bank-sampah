import 'package:bank_sampah_app/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Transaksi extends StatefulWidget {
  @override
  _TransaksiState createState() => new _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  double _animatedHeight = 0, _animatedHeight2 = 0, _animatedHeight3 = 0;
  bool isClicked = true, isClicked2 = true, isClicked3 = true;
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
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
          "Transaksi",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                GestureDetector(
                  onTap: () => setState(
                    () {
                      _animatedHeight != 0.0 ? _animatedHeight = 0.0 : _animatedHeight = 225.0;
                      isClicked = !isClicked;
                      _count++;
                    },
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '07/02/21',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+ Rp. 15.000',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF83B542),
                              ),
                            ),
                            Text(
                              'Penukaran Sampah',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Icon((!isClicked) ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                  ),
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(1),
                      ),
                    ],
                  ),
                  // padding: EdgeInsets.all(10),
                  child: (isClicked)
                      ? null
                      : DataTable(
                          key: ValueKey(_count),
                          columnSpacing: 36,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Kategori Sampah',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Berat (Kg)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Total (Rp)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Plastik')),
                                DataCell(Text('3')),
                                DataCell(Text('4.500')),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Kertas')),
                                DataCell(Text('3')),
                                DataCell(Text('4.500')),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Logam')),
                                DataCell(Text('4')),
                                DataCell(Text('6.000')),
                              ],
                            ),
                          ],
                        ),
                  height: _animatedHeight,
                  width: double.infinity,
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => setState(
                    () {
                      _animatedHeight2 != 0.0 ? _animatedHeight2 = 0.0 : _animatedHeight2 = 225.0;
                      isClicked2 = !isClicked2;
                      _count++;
                    },
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      top: 20,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '07/02/21',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+ Rp. 15.000',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF83B542),
                              ),
                            ),
                            Text(
                              'Penukaran Sampah',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Icon((!isClicked2) ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                  ),
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(1),
                      ),
                    ],
                  ),
                  // padding: EdgeInsets.all(10),
                  child: (isClicked2)
                      ? null
                      : DataTable(
                          key: ValueKey(_count),
                          columnSpacing: 36,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Kategori Sampah',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Berat (Kg)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Total (Rp)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Plastik')),
                                DataCell(Text('3')),
                                DataCell(Text('4.500')),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Kertas')),
                                DataCell(Text('3')),
                                DataCell(Text('4.500')),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Logam')),
                                DataCell(Text('4')),
                                DataCell(Text('6.000')),
                              ],
                            ),
                          ],
                        ),
                  height: _animatedHeight2,
                  width: double.infinity,
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => setState(
                    () {
                      _animatedHeight3 != 0.0 ? _animatedHeight3 = 0.0 : _animatedHeight3 = 225.0;
                      isClicked3 = !isClicked3;
                      _count++;
                    },
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          color: Colors.grey.withOpacity(1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '07/02/21',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+ Rp. 15.000',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF83B542),
                              ),
                            ),
                            Text(
                              'Penukaran Sampah',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Icon((!isClicked3) ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                  ),
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        color: Colors.grey.withOpacity(1),
                      ),
                    ],
                  ),
                  // padding: EdgeInsets.all(10),
                  child: (isClicked3)
                      ? null
                      : DataTable(
                          key: ValueKey(_count),
                          columnSpacing: 36,
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Kategori Sampah',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Berat (Kg)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Total (Rp)',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Plastik')),
                                DataCell(Text('3')),
                                DataCell(Text('4.500')),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Kertas')),
                                DataCell(Text('3')),
                                DataCell(Text('4.500')),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
                              cells: <DataCell>[
                                DataCell(Text('Logam')),
                                DataCell(Text('4')),
                                DataCell(Text('6.000')),
                              ],
                            ),
                          ],
                        ),
                  height: _animatedHeight3,
                  width: double.infinity,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class Transaksi extends StatefulWidget {
//   const Transaksi({Key? key}) : super(key: key);

//   @override
//   _TransaksiState createState() => _TransaksiState();
// }

// class _TransaksiState extends State<Transaksi> {
//   List<bool> isExpanded = [false, false, false, false];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leadingWidth: 100,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Row(
//             children: [
//               Icon(
//                 Icons.arrow_back_ios,
//                 color: Colors.white,
//               ),
//               Text(
//                 "Home",
//                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFF507B45),
//         title: Text(
//           "Transaksi",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextTilePage(),
//             TextTilePage(),
//             TextTilePage(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TextTilePage extends StatefulWidget {
//   @override
//   _TextTilePageState createState() => _TextTilePageState();
// }

// class _TextTilePageState extends State<TextTilePage> {
//   static final double radius = 20;

//   UniqueKey? keyTile;
//   bool isExpanded = false;

//   void expandTile() {
//     setState(() {
//       isExpanded = true;
//       keyTile = UniqueKey();
//     });
//   }

//   void shrinkTile() {
//     setState(() {
//       isExpanded = false;
//       keyTile = UniqueKey();
//     });
//   }

//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: EdgeInsets.all(12),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(radius),
//             side: BorderSide(color: Colors.black, width: 1),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(radius),
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: buildText(context),
//             ),
//           ),
//         ),
//       );

//   Widget buildText(BuildContext context) => ExpansionTile(
//         key: keyTile,
//         initiallyExpanded: isExpanded,
//         childrenPadding: EdgeInsets.all(0).copyWith(bottom: 0),
//         title: Row(
//           children: [
//             Text(
//               '07/02/21',
//               style: TextStyle(fontSize: 20, color: Colors.grey),
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '+ Rp. 15.000',
//                   style: TextStyle(fontSize: 18, color: Color(0xFF83B542)),
//                 ),
//                 Text(
//                   'Penukaran Sampah',
//                   style: TextStyle(fontSize: 12, color: Colors.grey),
//                 ),
//               ],
//             )
//           ],
//         ),
//         children: [
//           Divider(
//             height: 1,
//             thickness: 1,
//             color: Colors.black,
//           ),
//           DataTable(
//             columnSpacing: 36,
//             columns: <DataColumn>[
//               DataColumn(
//                 label: Text(
//                   'Kategori Sampah',
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Berat (Kg)',
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//               DataColumn(
//                 label: Text(
//                   'Total (Rp)',
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ),
//             ],
//             rows: <DataRow>[
//               DataRow(
//                 color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
//                 cells: <DataCell>[
//                   DataCell(Text('Plastik')),
//                   DataCell(Text('3')),
//                   DataCell(Text('4.500')),
//                 ],
//               ),
//               DataRow(
//                 color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
//                 cells: <DataCell>[
//                   DataCell(Text('Kertas')),
//                   DataCell(Text('3')),
//                   DataCell(Text('4.500')),
//                 ],
//               ),
//               DataRow(
//                 color: MaterialStateColor.resolveWith((states) => Color(0xFFECECEC)),
//                 cells: <DataCell>[
//                   DataCell(Text('Logam')),
//                   DataCell(Text('4')),
//                   DataCell(Text('6.000')),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       );
// }
