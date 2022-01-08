import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/models/note_model.dart';
import 'package:notes_bloc/screens/add_note_screen.dart';
import 'package:notes_bloc/widgets/text_title.dart';

class ListNotes extends StatelessWidget {
  final NoteModel noteModel;
  final int index;

  String getTimeString(date) {
    final dateTime = DateTime.parse(date);
    final format = DateFormat('yyyy-MM-dd – kk:mm');

    return format.format(dateTime);
  }

  const ListNotes({Key? key, required this.noteModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final notesBloc = BlocProvider.of<NotesBloc>(context);

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => AddNoteScreen(
                    update: true,
                    noteModel: noteModel,
                    index: index,
                  ))),
      child: Dismissible(
        key: Key(noteModel.title!),
        background: Container(),
        direction: DismissDirection.endToStart,
        secondaryBackground: Container(
          padding: const EdgeInsets.only(right: 35.0),
          margin: const EdgeInsets.only(bottom: 15.0),
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          child: const Icon(Icons.delete_sweep_outlined,
              color: Colors.white, size: 40),
        ),
        onDismissed: (direction) => notesBloc.add(DeleteNoteEvent(index)),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(bottom: 15.0),
          height: 110,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextTitle(
                      text: noteModel.title.toString(),
                      fontWeight: FontWeight.w600,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextTitle(
                    text: noteModel.category!,
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                children: [
                  TextTitle(
                    text: noteModel.body.toString(),
                    fontSize: 16,
                    color: Colors.grey,
                    textOverflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextTitle(
                    text: getTimeString(noteModel.created.toString()),
                    fontSize: 16,
                    color: Colors.grey,
                  ),
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
