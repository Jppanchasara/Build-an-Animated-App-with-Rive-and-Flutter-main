// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;
  bool isSignInDilogBoxShow = false;
  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/Backgrounds/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              // child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInDilogBoxShow ? -50 : 0,
            duration: Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    width: 260,
                    child: Column(
                      children: [
                        Text(
                          'Learn design & code',
                          style: TextStyle(
                              fontSize: 60, fontFamily: "Poppins", height: 1.2),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Don't skip design Learn design and code, by building real apps with flutter and Swift.Complete courses about the best tools. ",
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Animated_button(
                    btnAnimationController: _btnAnimationController,
                    press: () {
                      _btnAnimationController.isActive = true;
                      Future.delayed(Duration(milliseconds: 800), () {
                        setState(() {
                          isSignInDilogBoxShow = true;
                        });
                        showdialogbox(context);
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos,source files and certificates.",
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }

  Future<Object?> showdialogbox(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign In",
      context: context,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (_, animation, __, child) {
        Tween<Offset> tween;
        tween = Tween(begin: Offset(0, -1), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 620,
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.94),
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Access to 240+ hours of content. Learn design and code , by building real apps with Flutter and Swift.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SignInFrom(),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            "OR",
                            style: TextStyle(color: Colors.black26),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text("Sign up with Email.Apple or Goolge"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/apple_box.svg",
                              height: 64,
                              width: 64,
                            )),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/google_box.svg",
                              height: 64,
                              width: 64,
                            )),
                      ],
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInFrom extends StatelessWidget {
  const SignInFrom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/email.svg"),
            )),
          ),
        ),
        Text(
          "Password",
          style: TextStyle(color: Colors.black54),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset("assets/icons/password.svg"),
            )),
          ),
        ),
        ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xfff77dbe),
                minimumSize: Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)))),
            icon: Icon(
              CupertinoIcons.arrow_right,
              color: Color(0xFFFE0037),
            ),
            label: Text("Sign In")),
        SizedBox(
          height: 16,
        )
      ],
    ));
  }
}

class Animated_button extends StatelessWidget {
  const Animated_button({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Start the course",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
