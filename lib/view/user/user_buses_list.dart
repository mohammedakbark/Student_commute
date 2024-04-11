import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/user_controller.dart';
import 'package:student_commute/view/user/user_bus_details_page.dart';

class UserBusesList extends StatelessWidget {
  const UserBusesList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final busesController = Provider.of<UserController>(context);
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              height: size.height * 0.07,
              child: Center(
                child: Text(
                  'Buses',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: busesController.busesList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserBusDetailsPage(
                        busName: busesController.busesList[index]['name'],
                        regNo: busesController.busesList[index]['regNo'],
                      ),
                    ));
                  },
                  leading: const CircleAvatar(
                    backgroundColor: DEFAULT_BLUE_DARK,
                    child: Icon(
                      Iconsax.bus5,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    busesController.busesList[index]['name'],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  subtitle:
                      Text("(${busesController.busesList[index]['regNo']})"),
                );
              },
            ))
          ],
        ));
  }
}
