import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool? readOnly;
  final bool? autofocus;
  final TextEditingController? controller;
  final String title;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  const InputField(
      {Key? key,
      this.readOnly,
      this.autofocus,
      this.controller,
      required this.title,
      this.labelText,
      this.hintText,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 3),
        Container(
          padding: const EdgeInsets.only(left: 4.0),
          margin: const EdgeInsets.only(left: 11),
          height: 52,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: TextFormField(
            readOnly: readOnly == null ? false : true,
            autofocus: autofocus == null ? false : true,
            controller: controller,
            decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                suffixIcon: suffixIcon,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                )),
          ),
        ),
      ],
    );
  }
}
