import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var formKey = GlobalKey<FormState>();
String email = "", password = "", passwordConfirmation = "";

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                    children: [
                      IconButton(
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 16,
                            color: Colors.grey,
                          )),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Multi",
                        ),
                      ),
                      const Icon(
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
                    'Register Account',
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
                    'Complete your details or continue \nwith social media',
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
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (!emailValid) {
                        return "Email not valid";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
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
                    obscureText: true,
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
                      labelText: "Password",
                      hintText: "Enter your password",
                      suffixIcon: const Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    onSaved: (String? newValue) {
                      passwordConfirmation = newValue!;
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
                      labelText: "Confirm Password",
                      hintText: "Re-enter your password",
                      suffixIcon: const Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GetBuilder<AuthController>(builder: (controller) {
                    return controller.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : TextButton(
                            onPressed: () => signUp(context, authController),
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
                      GestureDetector(
                        onTap: () {
                          debugPrint("Google sign up clicked");
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffeeeff1),
                          ),
                          child: Image.asset("assets/icons/google.png"),
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
                  const Text(
                    'By continuing your confirm that you agree with our Term and Condition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(context, AuthController authController) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      debugPrint(email);
      debugPrint(password);
      debugPrint(passwordConfirmation);
      // call sign up API
      bool isSuccess = await authController.signUp(email, password);
      // if success
      // go to home screen
      if (isSuccess) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        debugPrint("Sigup faild");
      }
    }
  }
}
