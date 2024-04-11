import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/user_controller.dart';
import 'package:student_commute/view/user/user_buses_list.dart';

class UserTickets extends StatelessWidget {
  const UserTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ticketController = Provider.of<UserController>(context);
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserBusesList(),
                  ));
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/Bus2.png'),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.05,
              color: Colors.grey,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: ticketController.ticketList.length,
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
                    ticketController.ticketList[index]['route'],
                    style: GoogleFonts.poppins(),
                  ),
                  subtitle: Row(
                    children: [
                      Text(ticketController.ticketList[index]['time']),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(ticketController.ticketList[index]['fare']),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("(${ticketController.ticketList[index]['regNo']})"),
                    ],
                  ),
                );
              },
            ))
          ],
        ));
  }
}
