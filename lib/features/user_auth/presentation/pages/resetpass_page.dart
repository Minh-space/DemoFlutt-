
import 'package:demoflutterfirebase/features/global/common/toast.dart';
import 'package:demoflutterfirebase/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassWord_Page extends StatefulWidget {
  const ForgotPassWord_Page({super.key});

  @override
  State<ForgotPassWord_Page> createState() => _ForgotPassWord_PageState();
}

class _ForgotPassWord_PageState extends State<ForgotPassWord_Page> {

  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showToast(message: "Password reset link sent! Check your email");
    } on FirebaseAuthException catch (e) {
      print(e);
      showToast(message : e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot PassWord"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter Email to receive verification link and reset password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(
                height: 30,
              ),

              // Button Reset Pass
              MaterialButton(
                onPressed: _passwordReset,
                child: Text("Send Link"),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
