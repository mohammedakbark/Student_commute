import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/bus_controller.dart';
import 'package:student_commute/controller/user_controller.dart';
import 'package:student_commute/utils/style.dart';

class BusNotificationScreen extends StatelessWidget {
  const BusNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final notificationController = Provider.of<BusController>(context);
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
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                  unselectedLabelColor: Colors.grey,
                  dividerHeight: 0,
                  labelStyle: GoogleFonts.poppins(),
                  tabs: const [
                    Tab(
                      text: "Notification",
                    ),
                    Tab(
                      text: "Complaint View",
                    )
                  ]),
              Expanded(
                child: TabBarView(children: [
                  ListView.builder(
                    itemCount: notificationController.notificationList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: DEFAULT_BLUE_DARK,
                          backgroundImage: AssetImage("assets/userdp.png"),
                        ),
                        title: Text(
                          notificationController.notificationList[index]
                              ['name'],
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "(${notificationController.notificationList[index]['comment']})"),
                            const SizedBox(
                              width: 20,
                            ),
                            RatingStars(
                              starSize: 15,
                              starCount: notificationController
                                  .notificationList[index]['rating'],
                              starOffColor:
                                  const Color.fromARGB(255, 243, 191, 34),
                              valueLabelVisibility: false,
                            )
                            // Text(
                            //     "${notificationController.notificationList[index]['rating']}"),
                          ],
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: notificationController.notificationList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: DEFAULT_BLUE_DARK,
                          backgroundImage: AssetImage(
                            "assets/userdp.png",
                          ),
                        ),
                        title: Text(
                          notificationController.complaintList[index]['name'],
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${notificationController.complaintList[index]['complaint']}"),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Complaint Was registered",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
