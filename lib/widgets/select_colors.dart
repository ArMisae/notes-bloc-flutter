import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/widgets/circle.dart';

class SelectColors extends StatelessWidget {
  const SelectColors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Circle(
          color: 0xff1977F3,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xff1977F3)),
        ),
        Circle(
          color: 0xffF44235,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xffF44235)),
        ),
        Circle(
          color: 0xff4CAF50,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xff4CAF50)),
        ),
        Circle(
          color: 0xff0A557F,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xff0A557F)),
        ),
        Circle(
          color: 0xff9C27B0,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xff9C27B0)),
        ),
        Circle(
          color: 0xffE91C63,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xffE91C63)),
        ),
        Circle(
          color: 0xff000000,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xff000000)),
        ),
        Circle(
          color: 0xff009688,
          onPressed: () => notesBloc.add(SelectedColorEvent(0xff009688)),
        ),
      ],
    );
  }
}
