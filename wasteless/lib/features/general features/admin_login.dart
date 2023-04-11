import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/admin_bottom_navigation_bar.dart';
import 'package:wasteless/features/driver%20features/driver_bottom_navigation_bar.dart';
import 'package:wasteless/features/general%20features/widgets/choose_account_decoration_widget.dart';
import '../../../core/utils/assets_path.dart';
import 'account_type_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var arguments;

  Future signIn() async {
    final startIndex = '.';
    final index = _emailController.text.trim().indexOf(startIndex);
    final i = _emailController.text.trim().substring(index + 1);
    final FirebaseAuth auth = FirebaseAuth.instance;

    print(i);
    print(index);

    if (arguments["accountType"] == "Driver") {
      if (i.contains('driver.com')) {
        await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Navigator.pushNamed(context, DriverWasteNavigationBar.id);
      } else if (i.contains('admin.com')) {
        print("Sigin in with Admin ");
      } else {
        print("Erro Message ");
      }
    } else if (arguments["accountType"] == "Admin") {
      if (i.contains('admin.com')) {
        await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Navigator.pushNamed(context, AdminWasteNavigationBar.id);
      } else if (i.contains('driver.com')) {
        print("Sigin in with Driver ");
      } else {
        print("Erro Message ");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor:
          arguments['accountType'] == "Admin" ? PRIMARY_BLUE : PRIMARY_GREEN,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChooseAccountDecorationWidget(
                  primaryColor: arguments['accountType'] == "Admin"
                      ? PRIMARY_BLUE
                      : PRIMARY_GREEN,
                  primaryHeight: context.height * 0.16,
                  right: -10,
                  bottom: 10,
                  rotation: 150,
                  borderRadius: 180,
                  height: 0.70,
                  width: 1,
                ),
                Container(
                  height: context.height * 0.78,
                  decoration: BoxDecoration(
                      color: WHITE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, AccountType.id);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: PRIMARY_GREEN,
                                ),
                              )
                            ]),
                        Image.asset(
                          WASTELESS_LOGO,
                          height: context.height * 0.22,
                        ),
                        //subititle

                        const SizedBox(height: 40),

                        //Email TextField
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: arguments['accountType'] == "Admin"
                                  ? LIGHT_GREEN
                                  : LIGHT_BLUE,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: BLACK.withOpacity(0.25))
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: PRIMARY_GREEN,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        //Password TextField

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: arguments['accountType'] == "Admin"
                                  ? LIGHT_GREEN
                                  : LIGHT_BLUE,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    color: BLACK.withOpacity(0.25))
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: PRIMARY_GREEN,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 100,
                        ),

                        // LOGIN Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: signIn,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: arguments['accountType'] == "Admin"
                                      ? PRIMARY_GREEN
                                      : PRIMARY_BLUE,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        color: BLACK.withOpacity(0.25))
                                  ]),
                              child: const Center(
                                  child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    color: WHITE,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )),
                            ),
                          ),
                        ),
                      ]),
                )
              ]),
        ),
      ),
    );
  }
}
