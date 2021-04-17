import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../../constants.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return           ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height*0.45,
        decoration: BoxDecoration(
            gradient: primaryGradient
        ),
      ),
    );
  }
}
