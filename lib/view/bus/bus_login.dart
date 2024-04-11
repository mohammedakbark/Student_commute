import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:student_commute/const.dart';
import 'package:student_commute/controller/bus_controller.dart';
import 'package:student_commute/view/bus/bus_signup.dart';

class BusLogin extends StatelessWidget {
  const BusLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginController = Provider.of<BusController>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: loginController.loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Phone',
                style: GoogleFonts.poppins(),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: loginController.loginMobileController,
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
              const SizedBox(
                height: 10,
              ),
              Text(
                'Password',
                style: GoogleFonts.poppins(),
              ),
              Consumer<BusController>(
                  builder: (context, obsecureController, _) {
                return TextFormField(
                  obscureText: obsecureController.isObsecure,
                  controller: loginController.loginPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "*required field";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      isDense: true,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            obsecureController.changeObsecure();
                          },
                          icon: Icon(obsecureController.isObsecure
                              ? Iconsax.eye
                              : Iconsax.eye_slash))),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Remember me',
                    style: GoogleFonts.poppins(),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (loginController.loginKey.currentState!.validate()) {}
                  },
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          ContinuousRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                      minimumSize: MaterialStatePropertyAll<Size>(
                        Size.fromHeight(50),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(DEFAULT_BLUE_DARK)),
                  child: Text(
                    'Login Now',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.poppins(),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BusSignUp(),
                        ));
                      },
                      child: Text(
                        'Signup Now',
                        style: GoogleFonts.poppins(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
