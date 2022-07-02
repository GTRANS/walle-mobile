import '../constants/color_constants.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final void Function() refetch;
  const ErrorView({Key? key, required this.errorMessage, required this.refetch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Text(errorMessage, style: const TextStyle(color: CustomColors.error)),
        TextButton(
          onPressed: refetch,
          child: const Text(
            "Muat Ulang",
            style: TextStyle(
              color: CustomColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
