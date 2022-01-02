import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/widgets/text_title.dart';

class ItemCategory extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ItemCategory(
      {Key? key,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      border: Border.all(color: color, width: 4.0),
                      borderRadius: BorderRadius.circular(7.0)),
                ),
                const SizedBox(width: 10.0),
                TextTitle(text: text, fontSize: 19),
              ],
            ),
            BlocBuilder<NotesBloc, NotesState>(
              builder: (_, state) => state.category == text
                  ? const Icon(Icons.check)
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
