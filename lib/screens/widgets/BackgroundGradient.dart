import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({Key? key, required this.child}) : super(key: key);
  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return (Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xffff7944),
            Color(0xffff7048),
            Color(0xffff674d),
            Color(0xffff5e53),
            Color(0xfffe5558),
            Color(0xfffc4c5e),
            Color(0xfff94364),
            Color(0xfff63a6a),
          ],
        ),
      ),
      child: child,
    ));
  }
}
