import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/controller/user_controller.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recentSearchCOntroller =
        Provider.of<UserController>(context, listen: false);
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.3,
        children: List.generate(4, (index) {
          return Card(
            elevation: 5,
            child: SizedBox(
                height: 10,
                width: 500,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                                image: AssetImage('assets/Bus2.png'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recentSearchCOntroller.recentSearch[index]
                                  ['route'],
                              style: GoogleFonts.poppins(),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              recentSearchCOntroller.recentSearch[index]
                                  ['time'],
                              style: GoogleFonts.poppins(),
                            ),
                            Text(
                              recentSearchCOntroller.recentSearch[index]
                                  ['fare'],
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}
