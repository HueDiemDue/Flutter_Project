import 'package:flutter/material.dart';
import 'package:flutter_project/screens/widgets/BackgroundGradient.dart';
import 'package:flutter_project/utils/url.dart';

import '../utils/assets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final paddingHorizontal = screenWidth / 10;

    return Scaffold(
        body: BackgroundGradient(child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return (SafeArea(
        child: Column(
          children: [
            _appInformationView(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 26),
                    child: _signUpButtonView(text: 'Sign in with Facebook', icon: AssetsIcon.iconFb),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 26),
                    child: _signUpButtonView(text: 'Sign in with Twitter', icon: AssetsIcon.iconTw),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 8),
                    child: _signUpButtonView(text: 'Sign Up'),
                  ),
                  _signInView()
                ],
              ),
            ),
          ],
        ),
      ));
    })));
  }

  Widget _appInformationView() {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image(
            image: AssetImage(AssetsIcon.iconApp),
            width: 120,
            height: 120,
          ),
        ),
        RichText(
            text: const TextSpan(
          children: <TextSpan>[
            TextSpan(text: 'CONN', style: TextStyle(color: Color(0xfff63a6a))),
            TextSpan(text: 'EXION', style: TextStyle(color: Colors.white)),
          ],
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        )),
        const Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Find and Meet people around\nyou to find LOVE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }

  Widget _signUpButtonView({required String text, dynamic icon}) {
    var mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final widthButton = screenWidth * 8 / 10;
    const double heightButton = 60.0;
    const double paddingVerticalDivider = heightButton / 4;

    const gradient = LinearGradient(colors: [
      Color(0xffff7944),
      Color(0xfff63a6a),
    ], begin: Alignment.center);

    if (icon != null) {
      return (ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.white,
          fixedSize: Size(widthButton, heightButton),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 30,
              width: 30,
              fit: BoxFit.fitWidth,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, paddingVerticalDivider, 10, paddingVerticalDivider),
              child: VerticalDivider(
                color: Colors.deepOrange,
                thickness: 1,
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => gradient.createShader(Rect.fromLTRB(0, bounds.top, 0, bounds.bottom)),
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ));
    }

    return (ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.white,
        fixedSize: Size(widthButton, heightButton),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => gradient.createShader(Rect.fromLTRB(0, bounds.top, 0, bounds.bottom)),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }

  Widget _signInView() {
    return (TextButton(
      onPressed: () {
        Navigator.pushNamed(context, Urls.login);
      },
      child: Text('Already registered? Sign In'.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
            decoration: TextDecoration.underline,
          )),
    ));
  }
}
