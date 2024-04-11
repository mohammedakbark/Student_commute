import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/user_controller.dart';
import 'package:student_commute/utils/grid_view_home.dart';
import 'package:student_commute/view/user/user_profile.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userHomeController =
        Provider.of<UserController>(context, listen: false);
    return FutureBuilder(
        future: userHomeController.fetchUserData(context),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
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
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const UserProfile(),
                            ));
                          },
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/userdp.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'From',
                                        hintStyle: GoogleFonts.poppins(),
                                        isDense: true,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Iconsax.location))),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Iconsax.arrow_up_3,
                                          color: Colors.black,
                                        ),
                                        Icon(
                                          Iconsax.arrow_down,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'To',
                                        hintStyle: GoogleFonts.poppins(),
                                        isDense: true,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon:
                                                const Icon(Iconsax.location))),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        hintText: 'Date',
                                        hintStyle: GoogleFonts.poppins(),
                                        isDense: true,
                                        border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        prefixIcon: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Iconsax.calendar_1))),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        userHomeController.changeIndex(1);
                                      },
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll<
                                                  OutlinedBorder>(
                                              ContinuousRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              30)))),
                                          minimumSize:
                                              MaterialStatePropertyAll<Size>(
                                            Size.fromHeight(50),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  DEFAULT_BLUE_GREY)),
                                      child: Text(
                                        'Search Buses',
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlayInterval: const Duration(seconds: 2),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            viewportFraction: 1,
                            autoPlay: true,
                            aspectRatio: 20 / 9,
                          ),
                          itemCount: userHomeController.carouselList.length,
                          itemBuilder: (
                            context,
                            itemIndex,
                            pageViewIndex,
                          ) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                height: 142,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color:
                                      const Color.fromARGB(255, 30, 129, 221),
                                ),
                                child: Image.asset(
                                  userHomeController.carouselList[itemIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text('Recent Search'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SizedBox(
                            height: 220,
                            width: size.width,
                            child: const GridViewHome(),
                          ),
                        )
                      ],
                    ),
                  ),
                );
        });
  }
}
