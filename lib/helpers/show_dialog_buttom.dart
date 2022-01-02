import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/widgets/item_category.dart';
import 'package:notes_bloc/widgets/text_title.dart';

void showDialogBottom(BuildContext context) {
  final notesBloc = BlocProvider.of<NotesBloc>(context);

  showBottomSheet(
    context: context,
    builder: (context) => Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
        boxShadow: [
          BoxShadow(color: Colors.black54, blurRadius: 10, spreadRadius: -5.0)
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          const TextTitle(text: 'Seleccionar categoria', fontSize: 20),
          const SizedBox(height: 5.0),
          const Divider(),
          const SizedBox(height: 20.0),
          ItemCategory(
            color: Colors.blue,
            text: 'Personal',
            onPressed: () => notesBloc.add(
              SelectedCategoryEvent('Personal', Colors.blue),
            ),
          ),
          ItemCategory(
            color: Colors.green,
            text: 'Amigos',
            onPressed: () => notesBloc.add(
              SelectedCategoryEvent('Amigos', Colors.green),
            ),
          ),
          ItemCategory(
            color: Colors.purple,
            text: 'Trabajo',
            onPressed: () => notesBloc.add(
              SelectedCategoryEvent('Trabajo', Colors.purple),
            ),
          ),
          ItemCategory(
            color: Colors.orange,
            text: 'Mandados',
            onPressed: () => notesBloc.add(
              SelectedCategoryEvent('Mandados', Colors.orange),
            ),
          ),
          ItemCategory(
            color: Colors.grey,
            text: 'Sin lista',
            onPressed: () => notesBloc.add(
              SelectedCategoryEvent('Sin lista', Colors.grey),
            ),
          ),
        ],
      ),
    ),
  );
}
