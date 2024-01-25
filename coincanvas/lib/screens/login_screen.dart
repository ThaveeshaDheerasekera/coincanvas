import 'package:coincanvas/configs/custom_colors.dart';
import 'package:coincanvas/widgets/global/elevated_button_widget.dart';
import 'package:coincanvas/widgets/global/text_field_widget_copy.dart';
import 'package:coincanvas/widgets/global/title_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  String? succMessage = '';
  bool isLogin = true;
  // var user = Provider.of<AuthRepository>(context, listen: false)

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Widget _message() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2),
      ),
      width: double.infinity,
      child: const Text("message"
          // Provider.of<AuthRepository>(context, listen: false).getMessage,
          // textAlign: TextAlign.center,
          // style: TextStyle(
          //   color: Theme.of(context).primaryColor,
          // ),
          ),
    );
  }

  Widget _submitButton() {
    // var user = Provider.of<AuthRepository>(context, listen: false);
    return ElevatedButtonWidget(
      width: 100,
      height: 40,
      borderRadius: 2,
      onPressed: () async {
        // isLogin
        //     ? await user.signInWithEmailAndPassword(
        //         email: _emailController.text,
        //         password: _passwordController.text)
        //     : await user.createUserWithEmailAndPassword(
        //         name: _nameController.text,
        //         email: _emailController.text,
        //         password: _passwordController.text,
        //         conPassword: _confirmPasswordController.text);
      },
      child: Text(isLogin ? 'Login' : 'Sign Up'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
          errorMessage = '';
        });
      },
      child: Text(isLogin ? 'Sign Up instead' : 'Login instead'),
    );
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: CustomColors.tealBlue,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(
              title: isLogin ? 'Login' : 'Sign Up',
              actions: [
                ElevatedButtonWidget(
                  width: 50,
                  height: 30,
                  borderRadius: 2,
                  onPressed: () {
                    _emailController.clear();
                    _passwordController.clear();
                    setState(() {
                      // user.clearMessage();
                      errorMessage = '';
                      succMessage = '';
                    });
                  },
                  child: Text('Clear'),
                ),
              ],
              child: Column(
                children: [
                  !isLogin
                      ? TextFieldWidgetCopy(
                          hintText: 'Name',
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                        )
                      : const SizedBox(),
                  TextFieldWidgetCopy(
                    hintText: 'Email',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                  ),
                  TextFieldWidgetCopy(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                    textCapitalization: TextCapitalization.none,
                  ),
                  !isLogin
                      ? TextFieldWidgetCopy(
                          hintText: 'Confirm Password',
                          obscureText: true,
                          controller: _confirmPasswordController,
                          textCapitalization: TextCapitalization.none,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _loginOrRegisterButton(),
                      _submitButton(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
