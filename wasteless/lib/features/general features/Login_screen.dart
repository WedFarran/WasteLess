// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/strings/consts.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/admin_bottom_navigation_bar.dart';
import 'package:wasteless/features/driver%20features/driver_bottom_navigation_bar.dart';
import 'package:wasteless/features/general%20features/widgets/choose_account_decoration_widget.dart';
import 'package:wasteless/features/general%20features/widgets/login_button.dart';
import 'package:wasteless/features/general%20features/widgets/text_field.dart';
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
  String arguments = '';

  Future signIn() async {
    final index = _emailController.text.trim().indexOf('.');
    final i = _emailController.text.trim().substring(index + 1);
    final FirebaseAuth auth = FirebaseAuth.instance;

    if (arguments == DRIVER) {
      if (i.contains('driver.com')) {
        await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        if (!mounted) return;
        Navigator.pushNamed(context, DriverWasteNavigationBar.id);
      } else if (i.contains('admin.com')) {
        print("Sigin in with Admin ");
      } else {
        print("Erro Message ");
      }
    } else if (arguments == ADMIN) {
      if (i.contains('admin.com')) {
        await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        if (!mounted) return;
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

  bool secure = true;
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: arguments == ADMIN ? PRIMARY_BLUE : PRIMARY_GREEN,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChooseAccountDecorationWidget(
                  primaryColor:
                      arguments == ADMIN ? PRIMARY_BLUE : PRIMARY_GREEN,
                  primaryHeight: context.height * 0.16,
                  right: -10,
                  bottom: 10,
                  rotation: 150,
                  borderRadius: 180,
                  height: 0.70,
                  width: 1,
                ),
                Container(
                  height: context.height * 0.8,
                  decoration: const BoxDecoration(
                      color: WHITE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AccountType.id);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: PRIMARY_GREEN,
                                  ),
                                )
                              ]),
                        ),
                        Image.asset(
                          WASTELESS_LOGO,
                          height: context.height * 0.25,
                        ),
                        //subititle

                        SizedBox(height: context.height * 0.05),

                        //Email TextField

                        WasteLessTextField(
                          textController: _emailController,
                          color: arguments == ADMIN ? LIGHT_GREEN : LIGHT_BLUE,
                          title: translations(context).email,
                          obscureText: false,
                          hintColor:
                              arguments == ADMIN ? PRIMARY_GREEN : PRIMARY_BLUE,
                        ),
                        SizedBox(height: context.height * 0.02),

                        //Password TextField

                        WasteLessTextField(
                          textController: _passwordController,
                          title: translations(context).password,
                          color: arguments == ADMIN ? LIGHT_GREEN : LIGHT_BLUE,
                          obscureText: secure,
                          hintColor:
                              arguments == ADMIN ? PRIMARY_GREEN : PRIMARY_BLUE,
                          widget: GestureDetector(
                            onTap: () {
                              setState(() {
                                secure = !secure;
                              });
                            },
                            child: Icon(
                              secure == true
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: arguments == ADMIN
                                  ? PRIMARY_GREEN
                                  : PRIMARY_BLUE,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: context.height * 0.09,
                        ),

                        // LOGIN Button
                        Button(
                          title: translations(context).logIn,
                          onTap: signIn,
                          color:
                              arguments == ADMIN ? PRIMARY_GREEN : PRIMARY_BLUE,
                        ),
                        SizedBox(
                          height: context.height * 0.07,
                        ),
                      ]),
                )
              ]),
        ),
      ),
    );
  }
}