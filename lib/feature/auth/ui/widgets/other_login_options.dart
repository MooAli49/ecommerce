import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helper/spacing.dart';
import '../../controller/cubit/auth_cubit.dart';

class OtherLoginOptions extends StatelessWidget {
  const OtherLoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Or Sign in with',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        verticalSpacing(20),
        // Spacer(),
        IconButton(
          onPressed: () async {
            await context.read<AuthCubit>().signInWithGoogle();
          },
          icon: Icon(
            FontAwesomeIcons.google,
            size: 42,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
