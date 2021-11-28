import 'package:flutter/material.dart';
import 'package:game_memory_card/constants.dart';
import 'package:game_memory_card/size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(58),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(8)),
            ),
            primary: primaryColor),
        child: Text(title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
