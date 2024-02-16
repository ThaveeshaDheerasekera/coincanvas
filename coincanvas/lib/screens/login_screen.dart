import 'package:coincanvas/configs/constants.dart';
import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/repositories/auth_repository.dart';
import 'package:coincanvas/widgets/global/elevated_button_widget.dart';
import 'package:coincanvas/widgets/global/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Login/SignIn method
  void onSubmit() {
    // Auth Repository
    var auth = Provider.of<AuthRepository>(context, listen: false);

    // If isLogin is true, login method will be executed
    // else sign in function will be executed
    isLogin
        ? auth.signInWithEmailAndPassword(
            context: context,
            email: _emailController.text,
            password: _passwordController.text)
        : auth.createUserWithEmailAndPassword(
            context: context,
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text);
  }

  // Sign In and Login toggle button method
  void onChange() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Container(
                  width: Constants.screenSize(context).width,
                  height: Constants.screenSize(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Heading
                    Text(
                      isLogin ? 'Login' : 'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Email Text Field
                    labelWidget(context, 'Email'),
                    TextFieldWidget(
                      hintText: 'example@email.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10),
                    // Password Text Field
                    labelWidget(context, 'Password'),
                    TextFieldWidget(
                      hintText: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: !isLogin ? 10 : 0),
                    // Confirm Password TextField
                    // Only visible if isLogin is false
                    !isLogin
                        ? TextFieldWidget(
                            hintText: 'Confirm Password',
                            obscureText: true,
                            controller: _confirmPasswordController,
                          )
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    // Button Panel
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: onChange,
                          child: Text(
                              isLogin ? 'Sign Up instead' : 'Login instead'),
                        ),
                        ElevatedButtonWidget(
                          width: 50,
                          height: 30,
                          borderRadius: 2,
                          onPressed: onSubmit,
                          child: Text(isLogin ? 'Login' : 'Sign Up'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding labelWidget(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
