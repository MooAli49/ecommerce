import '../../../../core/helper/spacing.dart';
import '../../controller/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              onPressed: () async {
                //await context.read<AuthCubit>().signInWithFacebook();
              },
              icon: Icon(FontAwesomeIcons.facebook, size: 42),
            ),
            horizontalSpacing(10),
            IconButton(
              onPressed: () async {
                await context.read<AuthCubit>().signInWithGoogle();
              },
              icon: Icon(FontAwesomeIcons.google, size: 42),
            ),
          ],
        ),
      ],
    );
  }
}
