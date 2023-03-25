import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import 'widgets/centred_row.dart';

var formKey = GlobalKey<FormState>();
String email = "", password = "";
bool isChecked = false;
bool isVisible = false;

extension EmailValidation on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                        color: Colors.grey,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Sign in with your email and password \nor continue with social media',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    onSaved: (String? newValue) {
                      email = newValue!;
                    },
                    validator: (String? value) {
                      // if (value!.length < 5) {
                      //   return "The lengh is < 5";
                      // } else if (!value.contains("@")) {
                      //   return "Email must contains @";
                      // } else if (!value.contains(".")) {
                      //   return "Email must contains .";
                      // } else {
                      //   return null;
                      // }

                      if (!value!.isValidEmail()) {
                        return "Email not valid";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 25),
                      labelText: "Email",
                      hintText: "Enter your email",
                      suffixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !isVisible,
                    onSaved: (String? newValue) {
                      password = newValue!;
                    },
                    validator: (String? value) {
                      if (value!.length < 8) {
                        return "The lengh is < 8";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 25),
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          isVisible = !isVisible;
                          setState(() {});
                        },
                        icon: Icon(isVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          // Checkbox(
                          //   value: isChecked,
                          //   onChanged: changeCheckboxState,
                          // ),
                          StatefulCheckBox(),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  GetBuilder<AuthController>(builder: (controller) {
                    return controller.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : TextButton(
                            onPressed: () => signIn(context, authController),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xfff77546),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 130,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Continue'),
                          );
                  }),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        // padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffeeeff1),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/icons/google.svg",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffeeeff1),
                        ),
                        child: Image.asset("assets/icons/facebook.png"),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(9),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffeeeff1),
                        ),
                        child: Image.asset("assets/icons/twitter.png"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CentredRow(
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/signup");
                        },
                        child: const Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'Don\'t have an account? ',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Sign Up',
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         color: Colors.orange,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(context, AuthController authController) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      debugPrint(email);
      debugPrint(password);
      debugPrint(isChecked.toString());
      // call sign in API
      bool isSuccess = await authController.signIn(email, password);
      // if success
      // go to home screen
      if (isSuccess) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        debugPrint("Sigin faild");
      }
    }
  }

  void changeCheckboxState(bool? value) {
    debugPrint('changeCheckboxState: $value');
    isChecked = value!;
  }
}

class StatefulCheckBox extends StatefulWidget {
  const StatefulCheckBox({super.key});

  @override
  State<StatefulCheckBox> createState() => _StatefulCheckBoxState();
}

class _StatefulCheckBoxState extends State<StatefulCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: changeCheckboxState,
    );
  }

  void changeCheckboxState(bool? value) {
    isChecked = value!;
    setState(() {});
  }
}
