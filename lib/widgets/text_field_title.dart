import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldTitle extends StatelessWidget {
  final TextEditingController textEditingController;

  const TextFieldTitle({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: textEditingController,
        style: GoogleFonts.getFont('Inter'),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Título',
          contentPadding: EdgeInsets.only(left: 10.0),
        ),
      ),
    );
  }
}
