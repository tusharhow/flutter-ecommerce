import 'package:flutter/material.dart';

class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent({
    Key? key,
    @required this.hintText,
    @required this.controller,
  }) : super(key: key);

  final hintText;

  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          filled: true,
          fillColor: const Color(0xffC4C4C4).withOpacity(0.20),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black45,
          )),
      style: const TextStyle(
        color: Colors.black54,
      ),
    );
  }
}
