import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_bloc/bloc/notes/notes_bloc.dart';
import 'package:notes_bloc/helpers/set_color.dart';
import 'package:notes_bloc/models/note_model.dart';
import 'package:notes_bloc/widgets/category.dart';
import 'package:notes_bloc/widgets/select_colors.dart';
import 'package:notes_bloc/widgets/text_field_body.dart';
import 'package:notes_bloc/widgets/text_field_title.dart';
import 'package:notes_bloc/widgets/text_title.dart';

class AddNoteScreen extends StatefulWidget {
  final bool update;
  final NoteModel? noteModel;
  final int? index;

  const AddNoteScreen(
      {Key? key, required this.update, this.noteModel, this.index})
      : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.update) {
      _titleController = TextEditingController(text: widget.noteModel!.title);
      _noteController = TextEditingController(text: widget.noteModel!.body);

      BlocProvider.of<NotesBloc>(context)
          .add(SelectedColorEvent(widget.noteModel!.color!));
      BlocProvider.of<NotesBloc>(context).add(SelectedCategoryEvent(
          widget.noteModel!.category!, setColor(widget.noteModel!.category!)));
    }
  }

  @override
  void dispose() {
    clearText();
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void clearText() {
    _titleController.clear();
    _noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final notesBloc = BlocProvider.of<NotesBloc>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      appBar: AppBar(
        backgroundColor: const Color(0xffF2F3F7),
        elevation: 0,
        centerTitle: true,
        title: TextTitle(
          text: !widget.update ? 'Agregar Nota' : 'Editar Nota',
          fontWeight: FontWeight.w500,
          fontSize: 21,
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              notesBloc.add(AddNoteEvent(
                  title: _titleController.text,
                  body: _noteController.text,
                  isComplete: false,
                  color: notesBloc.state.color,
                  category: notesBloc.state.category,
                  created: DateTime.now()));

              clearText();
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              width: 60,
              child: const Icon(
                Icons.save,
                color: Color(0xff0C6CF2),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFieldTitle(
                textEditingController: _titleController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldBody(
                textEditingController: _noteController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Category(),
              const SizedBox(
                height: 30,
              ),
              const SelectColors()
            ],
          ),
        )),
      ),
    );
  }
}
