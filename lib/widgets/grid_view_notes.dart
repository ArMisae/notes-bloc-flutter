import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/models/note_model.dart';
import 'package:notes_bloc/widgets/text_title.dart';

class GridViewNotes extends StatelessWidget {
  final NoteModel noteModel;
  final int index;

  String getTimeString(date) {
    final dateTime = DateTime.parse(date);
    final format = DateFormat('yyyy-MM-dd');

    return format.format(dateTime);
  }

  const GridViewNotes({Key? key, required this.noteModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    return GestureDetector(
      child: Dismissible(
        key: Key(noteModel.title!),
        direction: DismissDirection.endToStart,
        background: Container(),
        secondaryBackground: Container(
          padding: const EdgeInsets.only(bottom: 35.0),
          margin: const EdgeInsets.only(bottom: 15.0),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: const Icon(Icons.delete, color: Colors.white, size: 40),
        ),
        onDismissed: (direction) => notesBloc.add(DeleteNoteEvent(index)),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(bottom: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: TextTitle(
                      text: noteModel.title.toString(),
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10.0),
              Expanded(
                child: TextTitle(
                  text: noteModel.body.toString(),
                  fontSize: 16,
                  color: Colors.grey,
                  textOverflow: TextOverflow.ellipsis,
                  maxLine: 8,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextTitle(
                      text: getTimeString(noteModel.created.toString()),
                      fontSize: 16,
                      color: Colors.grey),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.circle,
                      color: Color(noteModel.color!),
                      size: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
