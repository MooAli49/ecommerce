import 'package:ecommerce/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OtherLoginOptions extends StatelessWidget {
  const OtherLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Or sign in with'),
        verticalSpacing(20),
        // Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.facebook, size: 42),
            ),
            horizontalSpacing(10),
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.google, size: 42),
            ),
          ],
        ),
      ],
    );
  }
}
