import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/user_controller.dart';

class UserNotifications extends StatelessWidget {
  const UserNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final notificationController = Provider.of<UserController>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
          // actions: const [
          //   Padding(
          //     padding: EdgeInsets.only(right: 15),
          //     child: CircleAvatar(
          //       backgroundImage: AssetImage('assets/Bus2.png'),
          //     ),
          //   ),
          // ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              height: size.height * 0.10,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Notifications',
                      style: GoogleFonts.poppins(),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: notificationController.notificationList.length,
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
                    notificationController.notificationList[index]['route'],
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "(${notificationController.notificationList[index]['regNo']})"),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                          "${notificationController.notificationList[index]['status']} (${notificationController.notificationList[index]['reachTime']})"),
                    ],
                  ),
                );
              },
            ))
          ],
        ));
  }
}
