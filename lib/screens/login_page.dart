import 'package:flutter/material.dart';
import 'package:flutter_project/screens/widgets/BackgroundGradient.dart';
import 'package:flutter_project/screens/widgets/TextGradient.dart';
import 'package:flutter_project/screens/widgets/TextInputForm.dart';
import 'package:flutter_project/utils/assets.dart';
import 'package:flutter_project/utils/constants.dart';
import 'package:flutter_project/utils/url.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isRememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: _contextView(context),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _contextView(context) {
    var mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    return Scaffold(
        body: BackgroundGradient(child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Stack(
                children: <Widget>[
                  SafeArea(
                      child: Column(
                    children: [
                      _appInformationView(),
                      _formSignIn(context),
                    ],
                  )),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20, top: 10),
                      width: screenWidth,
                      color: Colors.black26,
                      child: _signUpView(),
                    ),
                  )
                ],
              ),
            ),
          ));
    })));
  }

  Widget _appInformationView() {
    return (Column(
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

  Widget _formSignIn(context) {
    var mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final paddingHorizontal = screenWidth / 10;
    final widthButton = screenWidth * 7 / 10;

    return (Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text('SIGN IN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingHorizontal, 8, paddingHorizontal, 32),
          child: TextInputForm(
            key: Keys.email,
            hintText: 'Enter Email',
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 18),
          child: TextInputForm(
            key: Keys.password,
            hintText: 'Password',
            obscureText: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 18),
          child: _rememberPasswordView(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 0),
          child: SizedBox(width: widthButton, height: 54, child: _buttonSubmitView()),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingHorizontal, 24, paddingHorizontal, 8),
          child: _connectSocialView(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingHorizontal, 0, paddingHorizontal, 0),
          child: _forgotPasswordView(),
        ),
      ],
    ));
  }

  Widget _rememberPasswordView() {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.orange;
      }
      return const Color(0xffff7944);
    }

    return (Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: _isRememberPassword,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          onChanged: (bool? value) {
            setState(() {
              _isRememberPassword = value!;
            });
          },
        ),
        const Text(
          'Remember Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    ));
  }

  Widget _buttonSubmitView() {
    return (ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(shape: const StadiumBorder(), backgroundColor: Colors.white),
        child: const TextGradient(
          text: 'GET STARTED',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          gradient: LinearGradient(colors: [
            Color(0xfff63a6a),
            Color(0xffff7944),
          ]),
        )));
  }

  Widget _connectSocialView() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buttonSocialView(AssetsIcon.iconFb),
        const SizedBox(
          width: 20,
        ),
        _buttonSocialView(AssetsIcon.iconTw),
      ],
    ));
  }

  Widget _forgotPasswordView() {
    return (TextButton(
      onPressed: () {},
      child: Text('Forgot password?'.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.white,
            decoration: TextDecoration.underline,
          )),
    ));
  }

  Widget _signUpView() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'DONT HAVE ACCOUNT?',
          style: TextStyle(
            color: Color(0xffff7944),
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Urls.signUp);
            },
            child: Text(
              'Sign Up'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ))
      ],
    ));
  }

  Widget _buttonSocialView(icon) {
    return (ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          minimumSize: const Size(65, 65),
        ),
        child: Image.asset(
          icon,
          height: 40,
          width: 40,
          fit: BoxFit.fitWidth,
        )));
  }
}
