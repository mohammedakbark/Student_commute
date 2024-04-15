import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/utils/style.dart';
import 'package:student_commute/utils/user_custom_appbar.dart';

class UserFareDetails extends StatelessWidget {
  const UserFareDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton.filled(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Iconsax.arrow_left,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'StudentCommute',
                  style: GoogleFonts.poppins(
                    color: DEFAULT_BLUE_DARK,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Search your bus',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: DEFAULT_BLUE_GREY,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(
            "Fare Deatails",
            style: poppinStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Center(
            child: DataTable(
              dataRowMinHeight: 25,
              dataRowMaxHeight: 30,

              border: TableBorder.all(),
              // showBottomBorder: true,
              decoration: BoxDecoration(),
              // border: TableBorder.all(),
              columns: [
                DataColumn(
                    label: Text("From",
                        style: poppinStyle(
                            fontWeight: FontWeight.bold, fontSize: 22))),
                DataColumn(
                    label: Text("To",
                        style: poppinStyle(
                            fontWeight: FontWeight.bold, fontSize: 22))),
                DataColumn(
                    label: Text(
                  "Rs",
                  style: poppinStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ))
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text("Perinthalmanna")),
                  DataCell(Text("Malappuram")),
                  DataCell(Text("6")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Perinthalmanna")),
                  DataCell(Text("Malappuram")),
                  DataCell(Text("6")),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
