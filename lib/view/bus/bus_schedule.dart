import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/bus_controller.dart';
import 'package:student_commute/controller/user_controller.dart';

class BusSchedulesScreen extends StatelessWidget {
  const BusSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scheduleController = Provider.of<BusController>(context);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => const UserBusesList(),
                  // ));
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/Bus2.png'),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Schedule",
                style: GoogleFonts.poppins(),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            // Container(
            //   width: size.width,
            //   height: size.height * 0.05,
            //   color: Colors.grey,
            // ),
            Expanded(
                child: ListView.builder(
              itemCount: scheduleController.scheduleList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: DEFAULT_BLUE_DARK,
                    child: Icon(
                      Iconsax.bus5,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    scheduleController.scheduleList[index]['route'],
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle:
                      Text(scheduleController.scheduleList[index]['time']),
                );
              },
            ))
          ],
        ));
  }
}
