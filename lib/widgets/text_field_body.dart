import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldBody extends StatelessWidget {
  final TextEditingController textEditingController;

  const TextFieldBody({Key? key, required this.textEditingController})
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
        maxLines: 10,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Escribe una nota...',
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
