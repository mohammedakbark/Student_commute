import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/bus_controller.dart';
import 'package:student_commute/utils/style.dart';

class BusAddScheduleScrren extends StatelessWidget {
  const BusAddScheduleScrren({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final scheduleController =
        Provider.of<BusController>(context, listen: false);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add Schedule",
                  style: poppinStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                'Vehicle Number',
                style: GoogleFonts.poppins(),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: scheduleController.scheduleVehiclenumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*required field";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                'Vehicle name',
                style: GoogleFonts.poppins(),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: scheduleController.scheduleVehicleNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*required field";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                'From',
                style: GoogleFonts.poppins(),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: scheduleController.scheduleFromController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*required field";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                'To',
                style: GoogleFonts.poppins(),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: scheduleController.scheduleToController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*required field";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                'Time',
                style: GoogleFonts.poppins(),
              ),
              TextFormField(
                textCapitalization: TextCapitalization.words,
                controller: scheduleController.scheduleTimeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "*required field";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: size.height * .025,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: size.width / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //       builder: (context) => const UserLogin(),
                      //     ),
                      //     (route) => false);
                    },
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll<OutlinedBorder>(
                            ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size.fromHeight(35),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(DEFAULT_BLUE_DARK)),
                    child: Text(
                      'Confirm',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
