import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusablePrimaryButton extends StatelessWidget {
  const ReusablePrimaryButton({Key? key, 
    required  this.childText,
    required  this.textColor,
    required  this.buttonColor,
    required  this.onPressed,
  }) : super(key: key);

  final String childText;
  final Function onPressed;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as VoidCallback,
      child: Container(
        height: 53,
        width: MediaQuery.of(context).size.width / 1.30,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(8), color: buttonColor),
        child: Center(
            child: Text(
          childText,
          style: GoogleFonts.raleway(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}